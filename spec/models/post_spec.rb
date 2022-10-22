require 'rails_helper'

RSpec.describe Post, type: :model do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',posts_counter:0)
    subject {Post.new(author: user, title: 'Hello', text: 'This is my first post',likes_counter: 0,comments_counter: 0)}
    before {subject.save}

    it 'author should be present' do
        subject.author = nil
        expect(subject).to_not be_valid
    end
    it 'title should be present' do
        subject.title = nil
        expect(subject).to_not be_valid
    end
    it 'text should be present' do
        subject.text = 'This is my first post'
        expect(subject).to be_valid
    end
    it 'title should be present' do
        subject.title = 'Hello'
        expect(subject).to be_valid
    end
    end