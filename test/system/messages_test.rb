require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  test "creating a message" do
    visit root_path
    click_on "Log In"
    click_on "Leave your message"

    fill_in "Content", with: "My message"
    fill_in "Name", with: "John"

    assert_difference -> { Message.count }, 1 do
      click_on "Create Message"
    end
  end
end
