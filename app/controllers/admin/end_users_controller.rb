class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @end_users = EndUser.with_deleted
  end
end
