class InvoicesController < ApplicationController
  inherit_resources

  respond_to :html

  def new
    @invoice = Invoice.new
    @invoice.items.build
  end
end
