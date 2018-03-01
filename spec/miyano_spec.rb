require "spec_helper"

RSpec.describe Miyano do

  it "has a version number" do
    expect(Miyano::VERSION).not_to be nil
  end

  it "can use beardown" do
    require "beardown"
    input = "* list1\n\n\n* beardown\n"
    output = "<ul><li>list1</li></ul>\n<br><br>\n<ul><li>beardown</li></ul>\n"
    expect(Beardown.new(input).to_html).to eql output
  end

  it "can use site global share variable" do
    #expect(@@site.class).to eql Miyano::Site
  end

  it "can build the world" do
    Miyano::Builder.new.build_the_world
    # help
  end
end




