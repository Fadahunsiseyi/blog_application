require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Sam', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Poland.', posts_counter: 1)
      @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post',
                                comments_counter: 0, likes_counter: 0)
      @second_post = Post.create(author: @user, title: 'Goodbye', text: 'This is my second post',
                                 comments_counter: 0, likes_counter: 0)
      @third_post = Post.create(author: @user, title: 'Sunshine', text: 'This is my third post',
                                comments_counter: 0, likes_counter: 0)
      @fourth_post = Post.create(author: @user, title: 'Ruby on Rails', text: 'This is my fourth post',
                                 comments_counter: 0, likes_counter: 0)
      visit "/users/#{@user.id}"
    end
    it 'should show user name' do
      expect(page).to have_content(@user.name)
    end
    it 'should show user bio' do
      expect(page).to have_content(@user.bio)
    end
    it 'should show user photo' do
      expect(page.html).to include(@user.photo)
    end
    it 'should show user post count' do
      expect(page.html).to have_content(@user.posts_counter)
    end
    it 'should have user first 3 posts' do
      expect(page).to have_content(@fourth_post.title)
      expect(page).to have_content(@third_post.title)
      expect(page).to have_content(@second_post.title)
    end
    it 'should have a button to see all posts' do
      expect(page.html).to include("<a class=\"see_all_post\" href=\"/users/#{@user.id}/posts\">See all Posts</a>")
    end
    it 'when clicked on a post, redirect to that post show page.' do
      click_on @second_post.title.to_s
      expect(current_path).to eq("/users/#{@user.id}/posts/#{@second_post.id}")
    end
    it 'when clicked on see all posts, redirect to the users posts index page.' do
      click_link 'See all Posts'
      expect(current_path).to eq("/users/#{@user.id}/posts")
    end
  end
end
