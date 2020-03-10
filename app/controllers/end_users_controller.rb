class EndUsersController < ApplicationController
  before_action :ensure_end_user, { only: [:show, :edit] }

  def show
    @end_user = EndUser.find(params[:id])
  end

  def confirm
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
  if @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user), info: "【登録情報を編集しました】"
  else
    render :edit
  end
end

def destroy
  end_user = EndUser.find(params[:id])
  end_user.destroy
  redirect_to root_path, danger: "【退会しました】"
end

private
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :phone_number, :email)
  end

  def ensure_end_user
    @end_user = EndUser.find(params[:id])
    if current_end_user.id != @end_user.id
      redirect_to root_path, danger: "【ユーザーログインしてください】"
    end
  end
end
