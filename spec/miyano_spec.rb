require "spec_helper"

RSpec.describe Miyano do
  it "has a version number" do
    expect(Miyano::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it "can read file from config.rb" do

  end

  it "has a site variable contain all data\
      about this blog" do
    site = Miyano::Site.new
    expect(site).not_to be nil
  end

  it "can get tags from html" do
    tags = Miyano::Util.get_tags "example.html"
    expect(tags).not_to be nil
  end

  it "can get tags from markdown" do
    tags = Miyano::Util.get_tags "example.md"
    expect(tags).not_to be nil
  end

end
