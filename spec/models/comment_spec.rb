require 'rails_helper'

describe Comment do
  it 'is valid without any attributes' do
    comment = Comment.new
    expect(comment).to be_valid
  end

  it 'belongs to a user through a post' do
    comment = Comment.new(comment: "This comment")

    post1 = Post.new(post: "this post", comments: [comment])

    user1 = User.new(posts: [post1])

    expect(user1.comments).to include(comment)
  end
end