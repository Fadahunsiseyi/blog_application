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
  

  end