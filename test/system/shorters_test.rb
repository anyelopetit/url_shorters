require "application_system_test_case"

class ShortersTest < ApplicationSystemTestCase
  setup do
    @shorter = shorters(:one)
  end

  test "visiting the index" do
    visit shorters_url
    assert_selector "h1", text: "Shorters"
  end

  test "creating a Shorter" do
    visit shorters_url
    click_on "New Shorter"

    fill_in "Expire time", with: @shorter.expire_time
    fill_in "Original url", with: @shorter.original_url
    fill_in "Redirect counter", with: @shorter.redirect_counter
    fill_in "Shorted url", with: @shorter.shorted_url
    click_on "Create Shorter"

    assert_text "Shorter was successfully created"
    click_on "Back"
  end

  test "updating a Shorter" do
    visit shorters_url
    click_on "Edit", match: :first

    fill_in "Expire time", with: @shorter.expire_time
    fill_in "Original url", with: @shorter.original_url
    fill_in "Redirect counter", with: @shorter.redirect_counter
    fill_in "Shorted url", with: @shorter.shorted_url
    click_on "Update Shorter"

    assert_text "Shorter was successfully updated"
    click_on "Back"
  end

  test "destroying a Shorter" do
    visit shorters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shorter was successfully destroyed"
  end
end
