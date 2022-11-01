require 'rails_helper'

RSpec.describe 'Render posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'John Carson', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am an auditor with 30 years working experience.', posts_counter: 0)
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                              author: @user)
    @second_post = Post.create(title: 'welcome', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                               author: @user)
    # 5.times do |_i|
    #   Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    # end
    @comment = Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    visit user_post_path(@first_post.author, @first_post)
  end

  scenario 'displays post text' do
    expect(page).to have_content('This is my first post')
  end

  scenario "renders user's profile picture" do
    all('img').each do |i|
      expect(i[:src]).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
    end
  end

  scenario 'shows the users username' do
    expect(page).to have_content('John Carson')
  end

  scenario 'shows number of posts by user' do
    user = User.first
    expect(page).to have_content(user.posts_counter)
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Hello')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content(@comment.text)
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('Likes: 0')
  end

  scenario "redirects the user to the post's show page after clicking on it" do
    visit '/'
    click_link(@user.name)
    expect(page).to have_content(@user.name)
  end
end