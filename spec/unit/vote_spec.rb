require 'rails_helper'

RSpec.describe 'Votes', type: :feature do
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

  let(:user) { User.create(name: 'Foo Bar', email: 'foo@bar.com', password: '12345678', admin: true) }
  scenario 'Like post' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit new_article_path
    fill_in :article_title, with: 'Article Title'
    fill_in :article_text, with: 'Article Text'
    select 'Events', from: 'selected_id'
    click_on 'Create Article'
    click_on 'Click to Vote!'
    expect(page).to have_content('Vote')
  end

  let(:user) { User.create(name: 'Foo Bar', email: 'foo@bar.com', password: '12345678', admin: true) }
  scenario 'Dislike post' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit new_article_path
    fill_in :article_title, with: 'Article Title'
    fill_in :article_text, with: 'Article Text'
    select 'Events', from: 'selected_id'
    click_on 'Create Article'
    click_on 'Click to Vote!'
    click_on 'Click to Unvote!'
    expect(page).to have_content('Vote')
  end
end
