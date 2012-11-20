require 'spec_helper'

describe 'feeds/index' do
  before(:each) do
    @feeds = FactoryGirl.create_list(:feed, 3)
  end

  it 'has an edit feed button' do
    render
    @feeds.each do |feed|
      rendered.should have_tag('a', with: { href: edit_feed_path(feed) })
    end
  end

  it 'has a delete feed button' do
    render
    @feeds.each do |feed|
      rendered.should have_tag('a', with: { href: feed_path(feed), 'data-method' => 'delete' })
    end
  end
end