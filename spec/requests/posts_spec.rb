require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  subject(:user) { User.create(name: 'mike', photo: 'https//link.photo-me', bio: 'I am a software developer') }
  describe 'GET /index' do
    it 'should give response as 200' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(200)
    end
    it 'should render #index template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end
    it 'should render text on template' do
      get "/users/#{user.id}/posts"
      response_body = response.body
      expect(response_body).to include('Posts')
    end
  end
  describe 'GET /show' do
    subject(:post) { Post.create(title: 'my-blog-post', text: 'this is my blog post', author_id: user.id) }
    it 'should give response as 200' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end
    it 'should render #index template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it 'should render text on template' do
      get "/users/#{user.id}/posts/#{post.id}"
      response_body = response.body
      expect(response_body).to include('hello posts')
    end
  end
end
