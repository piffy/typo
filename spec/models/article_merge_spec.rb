# coding: utf-8
require 'spec_helper'

describe "ArticleMerge" do
  before do
    @blog = stub_model(Blog)
    @blog.stub(:base_url) { "http://myblog.net" }
    @blog.stub(:text_filter) { "textile" }
    @blog.stub(:send_outbound_pings) { false }

    Blog.stub(:default) { @blog }

    @articles = []
  end

  it "should merge articles" do
    art = Article.new(:title => 'title', :body => 'first ', :published => true)
    assert art.save
    art = Article.find(art.id)
    art2 = Article.new(:title => 'title', :body => 'second ', :published => true)
    assert art2.save
    art2 = Article.find(art2.id)
    art.merge_with(art2.id)
    art.mergings.count.should == 1
    art.mergeds.count.should == 1
    art.mergeds.first.body.should == 'second '
  end
end