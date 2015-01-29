class DashboardsController < ApplicationController
  def show
    @invoices = Invoice.descending
  end
end
