class Admin::RibbonsController < ApplicationController
  def index
    @ribbon = Ribbon.new
    @ribbons = Ribbon.all
  end

  def edit
    @ribbon = Ribbon.find(params[:id])
  end

  def create
    @ribbon = Ribbon.new(ribbon_params)
    if @ribbon.save
      redirect_to admin_ribbons_path(@ribbons), notice: "You have creatad ribbon successfully."
    else
      @ribbons = Ribbon.all
      render action: :index
    end
  end

  def update
    @ribbon = Ribbon.find(params[:id])
    if @ribbon.update(ribbon_params)
      redirect_to admin_ribbons_path, notice: "You have updated ribbon successfully."
    else
      render action: :edit
    end
  end

  private
  def ribbon_params
    params.require(:ribbon).permit(:color,:image,:status)
  end

  def ensure_correct_user
    @ribbon = Ribbon.find_by(id: params[:id])
    if @ribbon.user_id != current_user.id
      redirect_to root_path
    end
  end
end
