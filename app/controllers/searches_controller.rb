class SearchesController < ApplicationController
  def new
  end

  def show
    @cards = Card.find matching_card_ids
  end

  private
    def search_params
      params.permit(:key, :value)
    end

    def matching_card_ids
      CardContent.where(key: params[:key]).where("value LIKE ?", "%#{params[:value]}%").pluck(:card_id)
    end
end
