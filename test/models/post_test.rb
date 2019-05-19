require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "it adds published_at if not already set" do

    post = Post.create!(title: "post", published: false)
    assert_nil post.published_at, "must not be set if not published"

    post.update!(published: true)
    assert_not_nil post.published_at

    old_value = post.published_at
    post.update!(published: false)
    assert_equal old_value, post.published_at, "should not be deleted if un-published"

    post.update!(published: true)
    assert_equal old_value, post.published_at, "should not be changed if re-published"
  end
end
