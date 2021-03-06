class PartiesController < ApplicationController

  def index
    @parties = Party.all

  end

  def new
    @parties = Party.all
    @party = Party.new
  end

  def create
    Party.create(party_params)
    redirect_to parties_path
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    party = Party.find(params[:id])
    party.update(party_params)
    redirect_to parties_path
  end

  def destroy
    Party.delete(params[:id])
    redirect_to parties_path
  end

  def show
    @parties = Party.all
    @party = Party.find(params[:id])
  end

  private

  def party_params
    params.require(:party).permit(:guests, :table_number, :seat_number, :user_id, :order_ticket_id, :name)
  end
end
