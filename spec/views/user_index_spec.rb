require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'John Snow', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a human right activist.', posts_counter: 0)
    @user2 = User.create(name: 'Magret Jones', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'I am a human right activist.', posts_counter: 0)
  end
  scenario 'displays all users username' do
    visit '/'
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'displays all users profile photo' do
    visit user_path(id: @user.id)
    visit user_path(id: @user2.id)
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  scenario 'displays number of posts' do
    visit '/'
    expect(page).to have_content(@user.posts_counter)
  end

  it "redirected to that user's show page when I click on a user" do
    visit '/'
    click_link(@user.name)
    expect(page).to have_content(@user.name)
  end
end
