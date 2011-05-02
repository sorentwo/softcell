class ClientsController < ApplicationController
  inherit_resources

  respond_to :html

  def create
    create! { dashboard_url }
  end

  def update
    update! { dashboard_url }
  end
end
