require 'spec_helper'

describe ClientsController do
  before do
    session[:persisted] = true
  end

  describe 'on POST to create' do
    let(:client) { mock_model(Client) }
    before do
      Client.should_receive(:new).and_return(client)
      client.should_receive(:save).and_return(true)

      post :create, client: {}
    end

    it { should respond_with(:redirect) }
    it { should redirect_to(dashboard_url) }
  end
end
