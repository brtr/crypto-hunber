class OffersController < ApplicationController
  before_action :get_offer, except: :index

  def index
    @page_index = 1
    @offers = Offer.order(created_at: :desc).page(params[:page]).per(20)
  end

  def update
    if @offer.update(offer_params)
      flash[:notice] = t("views.notice.project_update")
    else
      flash[:alert] = @offers.errors.full_messages.join(', ')
    end

    redirect_to offers_path
  end

  def take
    if @offer.remaining_count > 0
      history = @histories.first_or_create
      if history.submitted?
        history.taken!
        @offer.save
        flash[:notice] = t("views.notice.offer_take")
      else
        flash[:alert] = t("views.error.duplicate_take")
      end
    else
      flash[:alert] = t("views.error.no_count")
    end

    redirect_to offers_path
  end

  def complete
    history = @histories.take

    if history
      if history.taken?
        history.done!
        current_user.point.change_point(@offer.reward, "offer_complete")
        #AirdropTokenJob.perform_later(@offer.id, current_user.address, @offer.reward)
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

  def offer_params
    params.require(:offer).permit(:desc, :count, :cost)
  end
end
