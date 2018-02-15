require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Gives screenshots in case of test failures
  # driven_by :selenium_chrome_headless

  # Faster (no js)
  driven_by :rack_test
end
