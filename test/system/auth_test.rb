require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  test "logging in creates an user" do
    visit root_path

    assert_difference -> { User.count }, 1 do
      click_on "Log In"
    end

    within "nav" do
      refute_text "Log In"
      assert_text "Log Out"
    end
  end
end
