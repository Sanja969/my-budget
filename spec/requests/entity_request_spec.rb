require 'rails_helper'

RSpec.describe 'Entity', type: :request do
  include Devise::Test::IntegrationHelpers
  user = User.create(name: 'user', email: 'sanja-test@mail.com', password: 'password123', password_confirmation: 'password123')
  before do
    sign_in user
  end

  describe 'GET /new' do
    before(:example) { get new_entity_path }
    it 'Redirect status is correct' do
      expect(response).to have_http_status(200)
    end
    it 'renders the new template' do
      expect(response).to render_template('new')
    end
    it 'If the response body includes correct placeholder text.' do
      expect(response.body).to include('New Transaction')
    end
  end

  after(:context) { user.destroy }
end
