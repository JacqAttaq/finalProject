class MemebersController < ApplicationController
  def index
    @member = Member.all
    respond_to do |format|
      format.json { render json: @member }
      format.html
    end
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create member_params
    respond_to do |format|
      format.json { render json: @member}
    end
  end

  def edit
    respond_to do |format|
      format.json { render json: @member}
    end
  end

  def update
     respond_to do |format|
      format.json { render json: @member}
    end
  end

  def destroy 
    @member.destroy, method: :delete
    respond_to do |format|
      format.json { render json: @member}
    end 
  end

private

  def member_params
    params.require(:memeber).permit(
      :name,
      :location,
      :email
      )
  end

  def set_member
    @member = Member.find params[:id]
  end
end
