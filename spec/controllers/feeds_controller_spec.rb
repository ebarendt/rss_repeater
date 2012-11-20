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

    describe "GET 'index'" do
      it "assigns the user's feeds" do
        feeds = FactoryGirl.create_list(:feed, 3, user: @user)
        get :index
        assigns(:feeds).should == feeds
      end

      it "doesn't include another user's feeds" do
        another_user = FactoryGirl.create(:user)
        feeds = FactoryGirl.create_list(:feed, 3, user: another_user)
        get :index
        assigns(:feeds).should be_empty
      end
    end

    describe "GET 'new'" do
      it "creates a new feed for the user" do
        get :new
        assigns(:feed).user.should == @user
      end
    end

    describe "POST 'create'" do
      before(:each) do
        @feed_attrs = FactoryGirl.attributes_for(:feed)
      end

      it "creates a new feed" do
        lambda do
          post :create, feed: @feed_attrs
        end.should change(Feed, :count).by(1)
      end

      it "has a success message" do
        post :create, feed: @feed_attrs
        flash[:notice].should == "Your feed was saved."
      end

      it "renders the 'new' template again if it's missing the URL" do
        post :create, feed: @feed_attrs.merge(url: '')
        response.should render_template('new')
      end
    end
  end
end
