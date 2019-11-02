class SubPackagesController < ApplicationController
  before_action :set_sub_package, only: [:show, :edit, :update, :destroy]

  # GET /sub_packages
  # GET /sub_packages.json
  def index
    @sub_packages = SubPackage.all
  end

  # GET /sub_packages/1
  # GET /sub_packages/1.json
  def show
  end

  # GET /sub_packages/new
  def new
    @sub_package = SubPackage.new
  end

  # GET /sub_packages/1/edit
  def edit
  end

  # POST /sub_packages
  # POST /sub_packages.json
  def create
    @sub_package = SubPackage.new(sub_package_params)

    respond_to do |format|
      if @sub_package.save
        format.html { redirect_to @sub_package, notice: 'Sub package was successfully created.' }
        format.json { render :show, status: :created, location: @sub_package }
      else
        format.html { render :new }
        format.json { render json: @sub_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_packages/1
  # PATCH/PUT /sub_packages/1.json
  def update
    respond_to do |format|
      if @sub_package.update(sub_package_params)
        format.html { redirect_to @sub_package, notice: 'Sub package was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_package }
      else
        format.html { render :edit }
        format.json { render json: @sub_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_packages/1
  # DELETE /sub_packages/1.json
  def destroy
    @sub_package.destroy
    respond_to do |format|
      format.html { redirect_to sub_packages_url, notice: 'Sub package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_package
      @sub_package = SubPackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_package_params
      params.require(:sub_package).permit(:name, :package_id)
    end
end
