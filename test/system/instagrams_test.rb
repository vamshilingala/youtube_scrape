require "application_system_test_case"

class InstagramsTest < ApplicationSystemTestCase
  setup do
    @instagram = instagrams(:one)
  end

  test "visiting the index" do
    visit instagrams_url
    assert_selector "h1", text: "Instagrams"
  end

  test "creating a Instagram" do
    visit instagrams_url
    click_on "New Instagram"

    click_on "Create Instagram"

    assert_text "Instagram was successfully created"
    click_on "Back"
  end

  test "updating a Instagram" do
    visit instagrams_url
    click_on "Edit", match: :first

    click_on "Update Instagram"

    assert_text "Instagram was successfully updated"
    click_on "Back"
  end

  test "destroying a Instagram" do
    visit instagrams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Instagram was successfully destroyed"
  end
end
