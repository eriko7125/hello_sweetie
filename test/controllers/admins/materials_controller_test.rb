require 'test_helper'

class Admins::MaterialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_materials_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_materials_edit_url
    assert_response :success
  end

end
