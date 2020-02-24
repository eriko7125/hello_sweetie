class Admin::MaterialsController < ApplicationController
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
      redirect_to admin_materials_path(@materials), notice: "You have creatad material successfully."
    else
      @materials = Material.all
      render action: :index
    end
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      redirect_to admin_materials_path, notice: "You have updated material successfully."
    else
      render action: :edit
    end
  end

  private
  def material_params
    params.require(:material).permit(:name,:image,:status)
  end

  def ensure_correct_user
    @material = Material.find_by(id: params[:id])
    if @material.user_id != current_user.id
      redirect_to root_path
    end
  end
end
