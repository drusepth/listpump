require 'test_helper'

class TriggersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trigger = triggers(:one)
  end

  test "should get index" do
    get triggers_url
    assert_response :success
  end

  test "should get new" do
    get new_trigger_url
    assert_response :success
  end

  test "should create trigger" do
    assert_difference('Trigger.count') do
      post triggers_url, params: { trigger: { list_id: @trigger.list_id, name: @trigger.name, pattern: @trigger.pattern } }
    end

    assert_redirected_to trigger_url(Trigger.last)
  end

  test "should show trigger" do
    get trigger_url(@trigger)
    assert_response :success
  end

  test "should get edit" do
    get edit_trigger_url(@trigger)
    assert_response :success
  end

  test "should update trigger" do
    patch trigger_url(@trigger), params: { trigger: { list_id: @trigger.list_id, name: @trigger.name, pattern: @trigger.pattern } }
    assert_redirected_to trigger_url(@trigger)
  end

  test "should destroy trigger" do
    assert_difference('Trigger.count', -1) do
      delete trigger_url(@trigger)
    end

    assert_redirected_to triggers_url
  end
end
