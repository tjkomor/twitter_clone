require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

    test "logging in" do
      VCR.use_cassette('twitter_service#log_in', :record => :new_episodes) do
      visit "/"
      assert_equal 200, page.status_code
      click_button "Login"
      assert_equal "/", current_path
      assert page.has_content?("Tyler")
      assert page.has_link?("Logout")

      click_link "Logout"
      assert page.has_button?("Login")
    end
  end

end
