require 'rails_helper'

RSpec.describe 'Post Tweet', type: :system do
    before do
      driven_by(:selenium_chrome_headless)
  
      @user = User.create!(email: 'test@example.com', username: 'Test', password: 'password', password_confirmation: 'password')
  
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'password'
      click_on 'Log in'  
  
      expect(page).to have_text('successfully')  
  
      visit root_path
      expect(page).to have_current_path(root_path) 
    end
  
    it 'allows the user to post tweet', :aggregate_failures do
      fill_in "What's on your mind?", with: 'Test tweet'
      click_on 'Tweet'
  
      expect(page).to have_content('Test tweet', wait: 10)
    end

end