class QuotesController < ApplicationController

  before_action :authenticate_user!

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to new_quote_path
    else
      render :new
    end
  end

  def quote_params
    params.require(:quote).permit(:label)
  end
end

