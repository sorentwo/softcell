class InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new.build_items
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def edit
    @invoice = Invoice.find(params[:id]).build_items
  end

  def create
    @invoice = Invoice.create(invoice_params)

    redirect_to dashboard_path, notice: 'Invoice created'
  end

  def update
    @invoice = Invoice.find(params[:id])

    @invoice.update(invoice_params)

    redirect_to dashboard_path, notice: 'Invoice updated'
  end

  def print
    @invoice = Invoice.find(params[:id])

    render :print, layout: 'print'
  end

  def clone
    @invoice = Invoice.find(params[:id]).clone

    render :new
  end

  private

  def invoice_params
    params.require(:invoice).permit!
  end
end
