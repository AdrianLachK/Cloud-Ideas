class QuotesController < ApplicationController
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

  def destroy
    Quote.find_by(id: params[:id]).destroy
    redirect_to new_quote_path, :notice => "Your quote has been deleted"
  end

  def quote_params
    params.require(:quote).permit(:label, :user_id, :score)
  end
end

