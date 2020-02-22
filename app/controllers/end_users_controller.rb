class EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @end_user = EndUser.find(params[:id])
  end

  def confirm
  end

  def edit
    @end_user = EndUser.find(params[:id])
    if @end_user != current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end

  def update
    @end_user = EndUser.find(params[:id])
  if@end_user.update(end_user_params)
    redirect_to end_user_path(@end_user), notice: "You have updatad user successfully."
  else
    flash[:alert] = "Save Error!"
    render :edit
  end
end

def destroy
  end_user = EndUser.find(params[:id])
  end_user.destroy
  redirect_to root_path, notice: "Your account was successfully destroyed."
end

private
    def end_user_params
      params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :email)
    end

end
