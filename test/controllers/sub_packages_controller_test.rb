require 'test_helper'

class SubPackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_package = sub_packages(:one)
  end

  test "should get index" do
    get sub_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_package_url
    assert_response :success
  end

  test "should create sub_package" do
    assert_difference('SubPackage.count') do
      post sub_packages_url, params: { sub_package: { name: @sub_package.name, package_id: @sub_package.package_id } }
    end

    assert_redirected_to sub_package_url(SubPackage.last)
  end

  test "should show sub_package" do
    get sub_package_url(@sub_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_package_url(@sub_package)
    assert_response :success
  end

  test "should update sub_package" do
    patch sub_package_url(@sub_package), params: { sub_package: { name: @sub_package.name, package_id: @sub_package.package_id } }
    assert_redirected_to sub_package_url(@sub_package)
  end

  test "should destroy sub_package" do
    assert_difference('SubPackage.count', -1) do
      delete sub_package_url(@sub_package)
    end

    assert_redirected_to sub_packages_url
  end
end
