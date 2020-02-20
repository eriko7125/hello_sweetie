require 'test_helper'

class Admins::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_end_users_index_url
    assert_response :success
  end

end
