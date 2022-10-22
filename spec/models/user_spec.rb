require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'photo should be present' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end
  it 'bio should be present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end
  it 'posts_counter is too short' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end
end
