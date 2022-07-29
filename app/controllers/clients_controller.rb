class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def index
    @sum = params[:sum]
  end

  def show
   @id = params[:id]
  end
end
