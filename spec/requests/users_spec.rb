require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should give response as 200' do
      get '/users'
      expect(response).to have_http_status(200)
    end
    it 'should render #index template' do
      get '/users'
      expect(response).to render_template(:index)
    end
    it 'should render text on template' do
      get '/users'
      response_body = response.body
      expect(response_body).to include('Users')
    end
  end
  describe 'GET /show' do
    subject(:user) { User.create(name: 'mike', photo: 'https//link.photo-me', bio: 'I am a software developer') }
    it 'should give response as 200' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end
    it 'should render #show template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
    it 'should render text on template' do
      get "/users/#{user.id}"
      response_body = response.body
      expect(response_body).to include('Hello World')
    end
  end
end
