class Admin::RibbonsController < ApplicationController
  before_action :authenticate_admin_user!

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
      redirect_to admin_ribbons_path(@ribbons), notice: "【リボンを追加しました】"
    else
      @ribbons = Ribbon.all
      render action: :index
    end
  end

  def update
    @ribbon = Ribbon.find(params[:id])
    if @ribbon.update(ribbon_params)
      redirect_to admin_ribbons_path, notice: "【リボンを変更しました】"
    else
      render action: :edit
    end
  end

  private
  def ribbon_params
    params.require(:ribbon).permit(:color,:image,:status)
  end
end
