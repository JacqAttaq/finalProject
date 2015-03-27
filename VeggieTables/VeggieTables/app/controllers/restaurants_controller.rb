class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurant = Restaurant.all
    respond_to do |format|
      format.json { render json: @restaurant }
      format.html
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create restaurant_params
    respond_to do |format|
      format.json { render json: @restaurant}
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: @restaurant}
    end
  end

  def update
     respond_to do |format|
      format.json { render json: @restaurant}
    end
  end

  def destroy 
    @restaurant.destroy, method: :delete
    respond_to do |format|
      format.json { render json: @restaurant}
    end 
  end

private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :location,
      :email,
      :photo,
      :website,
      :description
      )

  end

  def set_restaurant
    @restaurant = Restaurant.find params[:id]
  end
end
