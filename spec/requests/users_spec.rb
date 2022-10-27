require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users'
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should respond with a correct template' do
      expect(response).to render_template(:index)
    end

    it 'body should have correct  placeholder text' do
      expect(response.body).to include('HELLO RAILS index')
    end
  end

  describe 'GET /show' do
    before(:example) do
      get '/users/1'
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end

    it 'body should includes correct placeholder text' do
      expect(response.body).to include('HELLO RAILS show')
    end
  end
end
