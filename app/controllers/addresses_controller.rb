class AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_end_user.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      redirect_to addresses_path, notice: "【配送先が登録されました】"
    else
      @addresses = current_end_user.addresses
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: "【配送先が編集されました】"
    else
      render action: :edit
    end
  end
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: "【配送先が削除されました】"
  end
  private
  
  def address_params
    params.require(:address).permit(:name, :zipcode, :address)
  end

end