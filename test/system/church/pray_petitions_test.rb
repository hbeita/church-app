require "application_system_test_case"

class Church::PrayPetitionsTest < ApplicationSystemTestCase
  setup do
    @church_pray_petition = church_pray_petitions(:one)
  end

  test "visiting the index" do
    visit church_pray_petitions_url
    assert_selector "h1", text: "Church/Pray Petitions"
  end

  test "creating a Pray petition" do
    visit church_pray_petitions_url
    click_on "New Church/Pray Petition"

    fill_in "Pray for", with: @church_pray_petition.pray_for
    fill_in "Request from", with: @church_pray_petition.request_from
    click_on "Create Pray petition"

    assert_text "Pray petition was successfully created"
    click_on "Back"
  end

  test "updating a Pray petition" do
    visit church_pray_petitions_url
    click_on "Edit", match: :first

    fill_in "Pray for", with: @church_pray_petition.pray_for
    fill_in "Request from", with: @church_pray_petition.request_from
    click_on "Update Pray petition"

    assert_text "Pray petition was successfully updated"
    click_on "Back"
  end

  test "destroying a Pray petition" do
    visit church_pray_petitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pray petition was successfully destroyed"
  end
end
