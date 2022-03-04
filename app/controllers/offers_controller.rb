class OffersController < ApplicationController
  before_action :get_offer, only: [:take, :complete]

  def index
    @page_index = 1
    @offers = Offer.order(created_at: :desc).page(params[:page]).per(20)
  end

  def take
    history = @histories.first_or_create
    if history.submitted?
      history.taken!
      @offer.count -= 1
      @offer.save
      flash[:notice] = t("views.notice.offer_take")
    else
      flash[:alert] = t("views.error.duplicate_take")
    end

    redirect_to offers_path
  end

  def complete
    history = @histories.take

    if history
      if history.taken?
        history.done!
        AirdropTokenJob.perform_later(@offer.id, current_user.address, @offer.reward)
        flash[:notice] = t("views.notice.offer_complete")
      else
        flash[:alert] = t("views.error.duplicate_complete")
      end
    else
      flash[:alert] = t("views.error.no_taken")
    end

    redirect_to offers_path
  end

  private
  def get_offer
    @offer = Offer.find params[:id]
    @histories = @offer.offer_histories.where(user_id: current_user.id)
  end
end
