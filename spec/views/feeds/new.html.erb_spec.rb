require 'spec_helper'

describe 'feeds/new' do
  before(:each) do
    user = FactoryGirl.create(:user)
    @feed = user.feeds.build
  end

  it 'has a url field' do
    render
    rendered.should have_tag('input', with: { type: 'url', name: 'feed[url]' })
  end

  it 'has a username field' do
    render
    rendered.should have_tag('input', with: { type: 'text', name: 'feed[username]' })
  end

  it 'has a password field' do
    render
    rendered.should have_tag('input', with: { type: 'password', name: 'feed[password]' })
  end
end