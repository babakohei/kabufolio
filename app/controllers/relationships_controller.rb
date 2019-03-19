class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    stock = Stock.find(params[:stock_id])
    current_user.watch(stock)
    flash[:success] = '銘柄をウォッチリストに追加しました。'
    redirect_to root_url
  end

  def destroy
    stock = Stock.find(params[:stock_id])
    current_user.unwatch(stock)
    flash[:success] = '銘柄をウォッチリストから削除しました。'
    redirect_to root_url
  end
end
