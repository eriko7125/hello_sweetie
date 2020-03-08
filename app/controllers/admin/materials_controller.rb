class Admin::MaterialsController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @material = Material.new
    @materials = Material.all
  end

  def edit
    @material = Material.find(params[:id])
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      redirect_to admin_materials_path(@materials), success: "【生地を追加しました】"
    else
      @materials = Material.all
      render action: :index
    end
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      redirect_to admin_materials_path, info: "【生地を変更しました】"
    else
      render action: :edit
    end
  end

  private
  def material_params
    params.require(:material).permit(:name,:image,:status)
  end
end
