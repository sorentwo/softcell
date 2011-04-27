require 'spec_helper'

describe DashboardsController do
  before do
    session[:persisted] = true
  end

  describe 'GET to show' do
    before { get :show }

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should assign_to(:invoices) }
  end
end
