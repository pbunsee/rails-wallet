class CardsController < ApplicationController
  def index
    if params[:user_id].present?
      @user = User.find params[:user_id]
      @cards = @user.cards
    else
      @cards = Card.all
    end
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.users << current_user

    respond_to do |format|
      format.js do
        @card.save!
      end

      format.html do
        @card.save!
        if @card.valid?
          @card.save!
          redirect_to cards_path
        else
          flash[:alert] = "There was an error with your submission"
          render :new
        end
      end
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def expired
    @cards = Card.expired
    render :index
  end


  private

  def card_params
    params.require(:card).permit(:number,
                                 :expiration_month,
                                 :expiration_year)
  end
end
