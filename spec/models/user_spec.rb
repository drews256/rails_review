require 'rails_helper'

describe User do
  it 'is invalid without a name' do
    user = User.new(id:1)
    expect(user).to be_invalid
  end

  it 'is valid only when you include a name, email, and password' do
    user = User.new(id:1, first_name: "Andrew", last_name:"Testy", email: "testy@test.com", password: "password")

    expect(user).to be_valid
  end

  it 'is only valid with a password longer than 8 characters' do
    user = User.new(id:1, first_name: "Andrew", last_name:"Testy", email: "testy@test.com", password: "pass")

    expect(user).to be_invalid

    user.update(password: "password")

    expect(user).to be_valid
  end

  it 'has many comments through a post' do
    comment1 = Comment.new(comment:"new comment one")
    comment2 = Comment.new(comment:"new comment two")
    post1 = Post.new(id:1, comments: [comment1, comment2])
    user = User.new(id:1, posts: [post1])

    expect(user.comments).to include(comment1, comment2)
  end

  it 'has many posts' do
    post = Post.new(id:1)

  end

  it 'is able to create a new post' do

  end
end
