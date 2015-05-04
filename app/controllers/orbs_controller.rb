class OrbsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @orb = current_user.orbs.build(orb_params)
    if @orb.save
      flash[:success] = "Orb added!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @orb.destroy
    flash[:success] = "Orb deleted"
    redirect_to request.referrer || root_url
  end
    
  private
    def orb_params
      params.require(:orb).permit(:category, :name, :description, :picture)
    end
    
    def correct_user
      @orb = current_user.orbs.find_by(id: params[:id])
      redirect_to root_url if @orb.nil?
    end
  
end
