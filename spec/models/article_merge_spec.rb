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
    art = Article.new(:title => 'title1', :body => 'first ', :published => true)
    assert art.save
    art = Article.find(art.id)
    art2 = Article.new(:title => 'title2', :body => 'second ', :published => true)
    assert art2.save
    art2 = Article.find(art2.id)
    art.merge_with(art2.id)
    assert art.save
    Article.find_all_by_title("title1").count.should == 1
    Article.find_all_by_title("title2").count.should == 0


  end
end