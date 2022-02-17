class OffersController < ApplicationController
  before_action :get_offer, only: [:take, :complete]

  def index
    @offers = Offer.order(created_at: :desc).page(params[:page]).per(20)
  end

  def take
    history = @offer.offer_histories.where(user_address: params[:user_address]).first_or_create
    if history.submitted?
      history.taken!
      flash[:notice] = "任务已领取"
    else
      flash[:alert] = "不能重复领取任务"
    end

    redirect_to offers_path
  end

  def complete
    history = @offer.offer_histories.where(user_address: params[:user_address]).take

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
  end
end
