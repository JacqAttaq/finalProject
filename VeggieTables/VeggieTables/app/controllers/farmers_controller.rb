class FarmersController < ApplicationController
  before_action :set_farmer, only: [:show, :edit, :update, :destroy]

def index
  @farmers = Farmer.all
  respond_to do |format|
    format.json { render json: @farmers.to_json}
    format.html
  end
end

def show
  respond_to do |format|
    format.json { render json: @farmer.to_json}
  end
end

def create
  @farmer = Farmer.create farmer_params
  respond_to do |format|
    format.json { render json: @farmer.to_json}
  end
  # redirect_to farmers_path
end

def new
  @farmer = Farmer.new
end

def edit
  respond_to do |format|
    format.json { render json: @farmer.to_json}
  end
end

def update
  respond_to do |format|
    format.json { render json: @farmer.to_json}
  end
end

def destroy
  @farmer.destroy, method: :delete
  respond_to do |format|
    format.json { render json: @farmer.to_json }
  end
end

private

def farmer_params
  params.require(:farmer).permit(
    :name,
    :location,
    :email,
    :photo,
    :description,
    :fruits,
    :vegetables,
    :herbs,
    :squash,
    :taters
    )
end

def set_farmer
  @farmer = Farmer.find params[:id]
end

end