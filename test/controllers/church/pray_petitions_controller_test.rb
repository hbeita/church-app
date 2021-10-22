require "test_helper"

class Church::PrayPetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @church_pray_petition = church_pray_petitions(:one)
  end

  test "should get index" do
    get church_pray_petitions_url
    assert_response :success
  end

  test "should get new" do
    get new_church_pray_petition_url
    assert_response :success
  end

  test "should create church_pray_petition" do
    assert_difference('Church::PrayPetition.count') do
      post church_pray_petitions_url, params: { church_pray_petition: { pray_for: @church_pray_petition.pray_for, pray_from: @church_pray_petition.pray_from } }
    end

    assert_redirected_to church_pray_petition_url(Church::PrayPetition.last)
  end

  test "should show church_pray_petition" do
    get church_pray_petition_url(@church_pray_petition)
    assert_response :success
  end

  test "should get edit" do
    get edit_church_pray_petition_url(@church_pray_petition)
    assert_response :success
  end

  test "should update church_pray_petition" do
    patch church_pray_petition_url(@church_pray_petition), params: { church_pray_petition: { pray_for: @church_pray_petition.pray_for, pray_from: @church_pray_petition.pray_from } }
    assert_redirected_to church_pray_petition_url(@church_pray_petition)
  end

  test "should destroy church_pray_petition" do
    assert_difference('Church::PrayPetition.count', -1) do
      delete church_pray_petition_url(@church_pray_petition)
    end

    assert_redirected_to church_pray_petitions_url
  end
end
