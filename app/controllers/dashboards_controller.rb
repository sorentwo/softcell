class DashboardsController < ApplicationController
  def show
    @invoices = Invoice.order('created_at DESC')
  end
end
