require 'test_helper'

class OrbsInterfaceTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
    
  def setup
    @user = users(:user1)
  end
    
  test "orb interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Orb.count' do
      post orbs_path, orb: { category: "", name: "", description: "" }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    category = "Sth"
    name = "Sth"
    description = "Something cool"
    assert_difference 'Orb.count', 1 do
      post orbs_path, orb: { category: category, name: name, description: description }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match category, response.body
    assert_match name, response.body
    assert_match description, response.body
    # Delete an orb.
    assert_select 'a', text: 'delete'
    first_orb = @user.orbs.paginate(page: 1).first
    assert_difference 'Orb.count', -1 do
      delete orb_path(first_orb)
    end
    # Visit a different user.
    get user_path(users(:clark))
    assert_select 'a', text: 'delete', count: 0
  end
end
