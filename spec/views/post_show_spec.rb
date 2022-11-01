require 'rails_helper'
RSpec.describe 'Renders the post show page', type: :feature do
    before :each do
      @user = User.create(name: 'John Carson', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'I am an auditor with 30 years working experience.', posts_counter: 0)
      @first_post = Post.create(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                                author_id: @user.id)
      @second_post = Post.create(title: 'welcome', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                                 author_id: @user.id)
    #   5.times do |_i|
    #     Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    #   end
    @comment =  Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
      visit user_post_path(@first_post.author, @first_post)
    end
  
    scenario 'displays the post title' do
      expect(page).to have_content(@first_post.title)
    end
  
    scenario 'shows the person who wrote the post' do
      expect(page).to have_content('John Carson')
    end
  
    it 'can see the username of each commentor.' do
      expect(page).to have_content('John Carson')
    end
  
    scenario 'displays number of comments' do
      expect(page).to have_content(@comment.text)
    end
  
    scenario 'displays number of likes' do
      expect(page).to have_content('Likes: 0')
    end
  
    scenario 'displays the content of the post' do
      expect(page).to have_content(@first_post.text)
    end
  
    scenario 'can see the comments of each commentor.' do
      expect(page).to have_content 'Nice post!!'
      expect(page).to have_content 'Nice post!!'
      expect(page).to have_content 'Nice post!!'
      expect(page).to have_content 'Nice post!!'
      expect(page).to have_content 'Nice post!!'
    end
  end