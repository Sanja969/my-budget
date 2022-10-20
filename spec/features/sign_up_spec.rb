require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
  before(:each) { visit new_user_registration_path }
  user = User.new
  describe 'signup page' do
    it 'has the input fields' do
      expect(page).to have_field 'user[name]'
      expect(page).to have_field 'user[email]'
      expect(page).to have_field 'user[password]'
      expect(page).to have_field 'user[password_confirmation]'
    end

    it 'prevents from signing up if inputs are empty' do
      find('#sign_up').click
      expect(page).to have_field 'user[name]'
    end

    it 'creates a new user' do
      fill_in 'user[name]', with: 'test1234'
      fill_in 'user[email]', with: 'example@example.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      find('#sign_up').click
      expect(page).to have_current_path(root_path)
    end
  end
  after(:context) { user.destroy }
end
