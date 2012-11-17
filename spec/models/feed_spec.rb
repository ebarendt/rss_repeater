require "spec_helper"

describe Feed do
  it "gets created with valid fields" do
    feed = FactoryGirl.build(:feed)
    feed.should be_valid
  end

  it "is invalid when it's missing a url" do
    feed = FactoryGirl.build(:feed, url: '')
    feed.should_not be_valid
  end
end