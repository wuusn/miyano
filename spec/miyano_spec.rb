require "spec_helper"

RSpec.describe Miyano do

  it "has a version number" do
    expect(Miyano::VERSION).not_to be nil
  end

  it "can use beardown" do
    require "beardown"
    input = "*beardown*\n"
    output = "<p><b>beardown</b></p>\n"
    expect(Beardown.new(input).to_html).to eql output
  end

  it "can use site global share variable" do
    #expect(@@site.class).to eql Miyano::Site
  end

  it "can build the world" do
    Miyano::Builder.new.build_the_world
  end
end




