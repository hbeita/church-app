# frozen_string_literal: true

require 'test_helper'

class PraysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pray = prays(:one)
  end

  test 'should get index' do
    get prays_url
    assert_response :success
  end

  test 'should get new' do
    get new_pray_url
    assert_response :success
  end

  test 'should create pray' do
    assert_difference('Pray.count') do
      post prays_url, params: { pray: { checked: @pray.checked, pray: @pray.pray, submitted_by: @pray.submitted_by } }
    end

    assert_redirected_to pray_url(Pray.last)
  end

  test 'should show pray' do
    get pray_url(@pray)
    assert_response :success
  end

  test 'should get edit' do
    get edit_pray_url(@pray)
    assert_response :success
  end

  test 'should update pray' do
    patch pray_url(@pray),
          params: { pray: { checked: @pray.checked, pray: @pray.pray, submitted_by: @pray.submitted_by } }
    assert_redirected_to pray_url(@pray)
  end

  test 'should destroy pray' do
    assert_difference('Pray.count', -1) do
      delete pray_url(@pray)
    end

    assert_redirected_to prays_url
  end
end
