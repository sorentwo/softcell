require 'spec_helper'

describe DashboardsController do
  describe 'GET to index' do
    before { get :index }

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should assign_to(:invoices) }
  end
end
