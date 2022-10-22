require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        posts_counter: 0)
    post = Post.create(author: user, title: 'Post communication', text: 'This is my first post', likes_counter: 0,
                        comments_counter: 0)
  end

  context 'Associations' do
    it 'belongs to an author' do
      comment = Comment.reflect_on_association('author')
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'belongs to a post' do
      comment = Comment.reflect_on_association('post')
      expect(comment.macro).to eq(:belongs_to)
    end
  end
end