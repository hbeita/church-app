require "test_helper"

class Spa::PrayControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spa_pray_new_url
    assert_response :success
  end
end
