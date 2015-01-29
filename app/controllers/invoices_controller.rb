class InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new
    build_items
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def edit
    @invoice = Invoice.find(params[:id])
    build_items
  end

  def print
    @invoice = Invoice.find(params[:id])

    render :print, layout: 'print'
  end

  private

  def build_items
    2.times { @invoice.items.build }
  end
end
