class StocksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :new, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    @stocks = Stock.all.page(params[:page])
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def edit
    @stock = Stock.find(params[:id])
    render :form
  end
  
  def update
    @stock = current_user.stocks.find(params[:id])

    if @stock.update(stock_params)
      flash[:success] = '銘柄は正常に更新されました。'
      redirect_to edit_stock_url(@stock)
    else
      flash.now[:danger] = '銘柄の更新に失敗しました。'
      render :form
    end
  end

  def new
    @stock = Stock.new
    render :form
  end

  def create
    @stock = current_user.stocks.build(stock_params)

    if @stock.save
      flash[:success] = '銘柄を登録しました。'
      redirect_to edit_stock_url(@stock)
    else
      flash.now[:danger] = '銘柄の登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @stock.destroy
    flash[:success] = '銘柄を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def stock_params
    params.require(:stock).permit(:code, :name)
  end

  def correct_user
    @stock = current_user.stocks.find_by(id: params[:id])
    unless @stock
      redirect_to root_url
    end
  end
end
