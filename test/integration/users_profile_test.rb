require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest    
  include ApplicationHelper

  def setup
    @user = users(:user1)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    # assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.orbs.count.to_s, response.body
    assert_select 'div.pagination'
    @user.orbs.paginate(page: 1).each do |orb|
      assert_match orb.category, response.body
      assert_match orb.name, response.body
      assert_match orb.description, response.body
    end
  end
end
