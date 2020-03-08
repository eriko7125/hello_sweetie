class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @orders = Order.all
    @today_orders = Order.where(created_at: (Time.zone.today.beginning_of_day)..(Time.zone.today.end_of_day))
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to admin_order_path(order), info: "注文ステータスを更新しました"
    else
      render :show
    end
  end

  def production_update
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(order_detail_params)
      redirect_to admin_order_path(order_detail.order_id), info: "製作ステータスを更新しました"
    else
      render :show
    end

  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end