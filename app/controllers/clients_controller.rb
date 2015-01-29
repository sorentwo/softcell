class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.create(client_params)

    redirect_to dashboard_url
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)

    redirect_to dashboard_url
  end

  private

  def client_params
    params.require(:client).allow!
  end
end
