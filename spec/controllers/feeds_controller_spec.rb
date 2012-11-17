require 'spec_helper'

describe FeedsController do

  describe 'when not logged in' do
    it 'get "index" redirects the user to log in' do
      get :index
      response.should redirect_to new_user_session_path
    end
  end

  describe 'when logged in' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it "get 'index' assigns the user's feeds" do
      feeds = FactoryGirl.create_list(:feed, 3, user: @user)
      get :index
      assigns(:feeds).should == feeds
    end

    it "the index doesn't include another user's feeds" do
      another_user = FactoryGirl.create(:user)
      feeds = FactoryGirl.create_list(:feed, 3, user: another_user)
      get :index
      assigns(:feeds).should be_empty
    end
  end
end
