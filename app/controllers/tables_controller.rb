class TablesController < ApplicationController
  respond_to :json, :html

  def index
    respond_with(Table.all)
  end

  def show
    @table = Table.includes(:reservations).find(params[:id])
  end

  
end
