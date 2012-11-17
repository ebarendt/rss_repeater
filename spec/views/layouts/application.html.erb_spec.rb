require 'spec_helper'

describe 'layouts/application' do

  describe 'when the user is not logged in' do
    it 'has a log in link' do
      render
      rendered.should have_tag('a', with: { href: new_user_session_path })
    end
  end

  describe 'when the user is logged in' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
      render
    end

    it 'has a log out link' do
      rendered.should have_tag('a', with: { href: destroy_user_session_path })
    end

    it "shows the user's email address" do
      rendered.should have_tag('li', text: "Log out #{@user.email}")
    end
  end
end