require 'rails_helper'

RSpec.describe 'Login' do
  before(:each) do
    visit new_user_session_path
  end

  it 'redirects to sign in page' do
    expect(page).to have_content 'LOGIN'
  end

  it 'has the input fields for email and password' do
    expect(page).to have_field 'user[email]'
    expect(page).to have_field 'user[password]'
  end

  it 'prevents from logging in if inputs are empty' do
    find('#log_in').click
    expect(page).to have_field 'user[email]'
    expect(page).to have_field 'user[password]'
  end

  it 'logs in succesfully and redirec to root path' do
    visit root_path
    @user = User.create(name: 'test', email: 'user@example.com', password: 'password123', password_confirmation: 'password123')
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    find('#log_in').click
    expect(page).to have_current_path(root_path)
  end
end