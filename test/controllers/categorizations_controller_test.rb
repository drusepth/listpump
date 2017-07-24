require 'test_helper'

class CategorizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categorization = categorizations(:one)
  end

  test "should get index" do
    get categorizations_url
    assert_response :success
  end

  test "should get new" do
    get new_categorization_url
    assert_response :success
  end

  test "should create categorization" do
    assert_difference('Categorization.count') do
      post categorizations_url, params: { categorization: { category_id: @categorization.category_id, list_id: @categorization.list_id } }
    end

    assert_redirected_to categorization_url(Categorization.last)
  end

  test "should show categorization" do
    get categorization_url(@categorization)
    assert_response :success
  end

  test "should get edit" do
    get edit_categorization_url(@categorization)
    assert_response :success
  end

  test "should update categorization" do
    patch categorization_url(@categorization), params: { categorization: { category_id: @categorization.category_id, list_id: @categorization.list_id } }
    assert_redirected_to categorization_url(@categorization)
  end

  test "should destroy categorization" do
    assert_difference('Categorization.count', -1) do
      delete categorization_url(@categorization)
    end

    assert_redirected_to categorizations_url
  end
end
