require 'spec_helper'

feature "logging in" do
  user = FactoryGirl.build(:confirmed_user)

  it "should work and view as a user" do
    pending
    # TODO: reimplent this test when views are complete.
    #
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    expect(page).to have_content
  end

end
