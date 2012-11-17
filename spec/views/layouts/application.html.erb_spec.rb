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
      user = FactoryGirl.create(:user)
      sign_in user
    end

    it 'has a log out link' do
      render
      rendered.should have_tag('a', with: { href: destroy_user_session_path })
    end
  end
end