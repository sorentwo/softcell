require 'spec_helper'

describe SessionsController do
  render_views

  describe 'on GET to new' do
    before { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  describe 'on POST to create' do
    let(:username) { 'username' }
    let(:password) { 'password' }

    context 'with valid credentials' do
      before do
        controller.should_receive(:authenticate).with(username, password).and_return(true)
        post :create, session: { username: username, password: password }
      end

      it { should respond_with(:redirect) }
      it { should redirect_to(root_url) }
      it { should set_session(:persisted).to(true) }
    end

    context 'with invalid credentials' do
      before { post :create }

      it { should render_template(:new) }
    end
  end

  describe 'on DELETE to destroy' do
    before { delete :destroy }

    it { should respond_with(:redirect) }
    it { should redirect_to(login_url) }
    it { should set_session(:persisted).to(nil) }
  end
end
