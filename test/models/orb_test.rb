require 'test_helper'

class OrbTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    
  def setup
    @user = users(:user1)
    @orb = @user.orbs.build(category: "Galaxy", name: "Sth", 
                            description: "Something cool")
  end

  test "should be valid" do
    assert @orb.valid?
  end

  test "user id should be present" do
    @orb.user_id = nil
    assert_not @orb.valid?
  end
  
  test "category should be present" do
    @orb.category = ""
    assert_not @orb.valid?
  end
    
  test "name should be present" do
    @orb.name = ""
    assert_not @orb.valid?
  end
    
  test "description should be present" do
    @orb.description = "     "
    assert_not @orb.valid?
  end

  test "description should be at most 300 characters" do
    @orb.description = "a" * 301
    assert_not @orb.valid?
  end
    
  test "order should be most recent first" do
    assert_equal Orb.first, orbs(:most_recent)
  end
end
