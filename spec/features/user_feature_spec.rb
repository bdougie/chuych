require 'spec_helper'

user = FactoryGirl.build(:user)

feature "login" do
  it "should work and view as a user" do
    visit root_path
     click_on 'Sign In'
     fill_in 'Email', with: user.email
     fill_in 'Password', with: user.password
     click_button 'Sign In'
     # save_and_open_page

    # assert page.has_content?("Discover Churches")
    assert_redirected_to root_path
  end
end


