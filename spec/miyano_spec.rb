require "spec_helper"

RSpec.describe Miyano do

  it "has a version number" do
    expect(Miyano::VERSION).not_to be nil
  end

  it "can use beardown" do
    require "beardown"
    input = "* list1\n\n\n* beardown\n"
    output = "<ul><li>list1</li></ul>\n<br>\n<br>\n<ul><li>beardown</li></ul>\n"
    expect(Beardown.new(input).to_html).to eql output
  end

  it "can get tag from bearnote" do
    require "beardown"
    bear = Beardown.new "#tag1/tag2/tag3"
    expect(bear.tags).to eql ["tag1", "tag1/tag2", "tag1/tag2/tag3"]
  end

  it "can use site global share variable" do
    #expect(@@site.class).to eql Miyano::Site
  end

  it "can build the world" do
    Miyano::Builder.new.build_the_world
  end

  it "can delete cached files and dirs when building" do
    #Miyano::Build.new.clean
  end
end




