class InvoicesController < ApplicationController
  inherit_resources

  respond_to :html

  def new
    @invoice = Invoice.new
    build_items
  end

  def edit
    @invoice = Invoice.find(params[:id])
    build_items
  end

  private

  def build_items
    2.times { @invoice.items.build }
  end
end
