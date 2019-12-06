class DashboardsController < ApplicationController
  def show
    @invoices = Invoice.descending.preload(:items)
  end
end
