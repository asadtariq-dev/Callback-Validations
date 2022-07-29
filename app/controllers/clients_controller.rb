class ClientsController < ApplicationController
  def new
    @client = Client.new
  end
  def index
    @sum = params[:sum]
  end
end
