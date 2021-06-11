# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'Sign in and sign up' do
    before :each do
      Category.create(id: 1, name: 'News', priority: 1)
      Category.create(id: 2, name: 'Events', priority: 2)
      Category.create(id: 3, name: 'Patch Notes', priority: 2)
      Category.create(id: 4, name: 'Releases', priority: 2)
      Category.create(id: 5, name: 'Dota', priority: 3)
      Category.create(id: 6, name: 'VALORANT', priority: 3)
      Category.create(id: 7, name: 'LOL', priority: 3)
      Category.create(id: 8, name: 'CS:GO', priority: 3)
    end

    scenario 'Sign up with valid inputs' do
      visit new_user_registration_path
      fill_in 'Name', with: 'Foo Bar'
      fill_in 'Email', with: 'foo@bar.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_on 'Sign up'
      sleep(3)
      visit root_path
      expect(page).to have_content('Foo Bar')
    end

    scenario 'Sign up with invalid inputs' do
      visit new_user_registration_path
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'foo@bar.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_on 'Sign up'
      sleep(3)
      visit root_path
      expect(page).to_not have_content('Foo Bar')
    end

    let(:user) { User.create(name: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
    scenario 'Log in with valid inputs' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      sleep(3)
      expect(page).to have_content('Foo Bar')
    end

    scenario 'Log in with invalid inputs' do
      visit new_user_session_path
      fill_in 'Email', with: 'Banana'
      fill_in 'Password', with: user.password
      click_on 'Log in'
      sleep(3)
      expect(page).to_not have_content('Foo Bar')
    end
  end
end
# rubocop:enable Metrics/BlockLength
