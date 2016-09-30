require 'rails_helper'

describe Post do
  it 'is valid without any attributes' do
    post = Post.new
    expect(post).to be_valid
  end

  it 'is valid with a name' do
    post = Post.new(user_id: 1)
    expect(post).to be_valid
  end

  it 'has many comments' do
    comment = Comment.new(comment: "This is a new comment")
    post = Post.new(comments: [comment])

    expect(post.comments).to include(comment)
    expect(post.comments.first).to eq(comment)
  end

  it "belongs to a user " do #antoher way to test this?
    post = Post.new(user_id: 1)
    user = User.new(id: 1, posts: [post])
    expect(post.user_id).to eq(1)
    expect(user.posts).to include(post)
  end

end