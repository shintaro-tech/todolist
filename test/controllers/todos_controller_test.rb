require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get todos_create_url
    assert_response :success
  end

  test "should get destroy" do
    get todos_destroy_url
    assert_response :success
  end

end
