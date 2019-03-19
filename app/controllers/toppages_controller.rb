class ToppagesController < ApplicationController
  def index
    if logged_in?
      @stock = current_user.stocks.build
      @stocks = current_user.stocks.order('code DESC').page(params[:page])
      @watches = current_user.watchlists
    end
  end
end
