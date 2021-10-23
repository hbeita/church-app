# frozen_string_literal: true

require 'application_system_test_case'

class PraysTest < ApplicationSystemTestCase
  setup do
    @pray = prays(:one)
  end

  test 'visiting the index' do
    visit prays_url
    assert_selector 'h1', text: 'Prays'
  end

  test 'creating a Pray' do
    visit prays_url
    click_on 'New Pray'

    check 'Checked' if @pray.checked
    fill_in 'Pray', with: @pray.pray
    fill_in 'Submitted by', with: @pray.submitted_by
    click_on 'Create Pray'

    assert_text 'Pray was successfully created'
    click_on 'Back'
  end

  test 'updating a Pray' do
    visit prays_url
    click_on 'Edit', match: :first

    check 'Checked' if @pray.checked
    fill_in 'Pray', with: @pray.pray
    fill_in 'Submitted by', with: @pray.submitted_by
    click_on 'Update Pray'

    assert_text 'Pray was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Pray' do
    visit prays_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Pray was successfully destroyed'
  end
end
