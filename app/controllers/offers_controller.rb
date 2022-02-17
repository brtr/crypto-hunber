class OffersController < ApplicationController
  before_action :get_offer, only: [:take, :complete]

  def index
    @offers = Offer.order(created_at: :desc).page(params[:page]).per(20)
  end

  def take
    history = @histories.first_or_create
    if history.submitted?
      history.taken!
      @offer.count -= 1
      @offer.save
      flash[:notice] = "任务已领取"
    else
      flash[:alert] = "不能重复领取任务"
    end

    redirect_to offers_path
  end

  def complete
    history = @histories.take

    if history
      if history.taken?
        history.done!
        flash[:notice] = "任务已完成"
      else
        flash[:alert] = "不能重复领取奖励"
      end
    else
      flash[:alert] = "您还没有领取任务，不能领取奖励"
    end

    redirect_to offers_path
  end

  private
  def get_offer
    @offer = Offer.find params[:id]
    @histories = @offer.offer_histories.where(user_id: current_user.id)
  end
end
