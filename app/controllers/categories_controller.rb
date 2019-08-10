class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  def search
    @results ||= []
    session[:categories] = params[:categories]
    category = Category.where('lower(name) = ?', "#{params[:categories][:name].downcase}")
    sub_category = SubCategory.where('lower(name) = ?', "#{params[:categories][:name].downcase}")
    if category.present?
      id = category.last.id
    elsif sub_category.present?
      id = sub_category.last.id
    end
    query = make_query(id, params[:categories][:city])
    @results = ActiveRecord::Base.connection.select_all(query).entries if params[:categories][:name].present? && params[:categories][:city].present?
    render :search_results
  end

  def search_by_category
    @results ||= []
    sub_category = SubCategory.where(id: params[:subcategory_id])
    query = make_query sub_category.last.id if sub_category.present?
    @results = ActiveRecord::Base.connection.select_all(query).entries if query.present?
    render :search_results
  end

  def autocomplete_categories
    categories = Category.where("lower(name) LIKE ?", "%#{params[:term].downcase}%").order(:name).limit(5).pluck("name")
    sub_categories = SubCategory.where("lower(name) LIKE ?", "%#{params[:term].downcase}%").order(:name).limit(5).pluck("name")
    results = (categories + sub_categories).map{|s| s.titleize}
    respond_to do |format|
      format.json { render json: results}
    end    
  end

  def find_near_area
    categories = session[:categories]
    category = Category.where('lower(name) = ?', "#{categories["name"].downcase}")
    sub_category = SubCategory.where('lower(name) = ?', "#{categories["name"].downcase}")
    if category.present?
      id = category.last.id
    elsif sub_category.present?
      id = sub_category.last.id
    end
    query = make_query(id, categories["city"], params[:area])
    @results = ActiveRecord::Base.connection.select_all(query).entries
    render :search_results
  end

  def make_query cat_name, city = nil, area = nil
    if cat_name.present? && city.present? && area.present?
      "SELECT sub_categories.id as cat_id, users.email, users.first_name, users.last_name, users.id, profiles.avatar, profiles.city, profiles.state, profiles.country, profiles.introduction FROM sub_categories INNER JOIN users ON users.sub_category_id = sub_categories.id LEFT OUTER JOIN profiles ON profiles.user_id = users.id WHERE (sub_categories.category_id = #{cat_name} or sub_categories.id = #{cat_name}) and users.city_id = #{city} and users.area_id = #{area}"
    elsif cat_name.present? && city.present? && area.blank?
      "SELECT sub_categories.id as cat_id, users.email, users.first_name, users.last_name, users.id, profiles.avatar, profiles.city, profiles.state, profiles.country, profiles.introduction FROM sub_categories INNER JOIN users ON users.sub_category_id = sub_categories.id LEFT OUTER JOIN profiles ON profiles.user_id = users.id WHERE (sub_categories.category_id = #{cat_name} or sub_categories.id = #{cat_name}) and users.city_id = #{city}"
    elsif cat_name.present? && city.blank? && area.blank?
      "SELECT sub_categories.id as cat_id, users.email, users.first_name, users.last_name, users.id, profiles.avatar, profiles.city, profiles.state, profiles.country, profiles.introduction FROM sub_categories INNER JOIN users ON users.sub_category_id = sub_categories.id LEFT OUTER JOIN profiles ON profiles.user_id = users.id WHERE (sub_categories.id = #{cat_name})"
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :desc)
    end

    def search_params
      params.require(:categories).permit(:name)
    end
end
