class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    if @card.valid?
      redirect_to cards_path
    else
      flash[:alert] = "There was an error with your submission"
      render :new
    end
  end


  private

  def card_params
    params.require(:card).permit(:number,
                                 :expiration_month,
                                 :expiration_year)
  end
end
