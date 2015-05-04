require 'test_helper'

class OrbsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
    
  def setup
    @orb = orbs(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Orb.count' do
      post :create, orb: { category: "Galaxy", name: "Sth", description: "Something cool" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Orb.count' do
      delete :destroy, id: @orb
    end
    assert_redirected_to login_url
  end
    
  test "should redirect destroy for wrong orb" do
    log_in_as(users(:user1))
    orb = orbs(:four)
    assert_no_difference 'Orb.count' do
      delete :destroy, id: orb
    end
    assert_redirected_to root_url
  end
end
