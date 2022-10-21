require 'rails_helper'

RSpec.describe 'Group', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'user1', email: 'test111@mail.com', password: 'password123', password_confirmation: 'password123') }
  let(:group) { user.groups.create(name: 'test', image_data: '{"id":"75a66e471ff934c9be8d1656c8ba42bc.jpeg","storage":"store","metadata":{"filename":"STL136320.jpeg","size":166852,"mime_type":"image/jpeg"}}') }
  before do
    sign_in user
  end

  describe 'GET /index' do
    before(:example) { get groups_path }
    it 'Redirect status is correct' do
      expect(response).to have_http_status(200)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'If the response body includes correct placeholder text.' do
      expect(response.body).to include('Categories')
    end
  end

  describe 'GET /show' do
    before(:example) { get group_path(group.id) }
    it 'Redirect status is correct' do
      expect(response).to have_http_status(200)
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'If the response body includes correct placeholder text.' do
      expect(response.body).to include('Transactions')
    end
  end

  describe 'GET /new' do
    before(:example) { get new_group_path }
    it 'Redirect status is correct' do
      expect(response).to have_http_status(200)
    end
    it 'renders the new template' do
      expect(response).to render_template('new')
    end
    it 'If the response body includes correct placeholder text.' do
      expect(response.body).to include('New Category')
    end
  end
end
