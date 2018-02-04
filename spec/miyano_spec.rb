require "spec_helper"

RSpec.describe Miyano do

  site = Miyano.site

  it "has a version number" do
    expect(Miyano::VERSION).not_to be nil
  end

  it "has a site variable" do
    expect(Miyano.site).not_to be nil
  end

  it "can render html and send post to site" do
    Miyano::Renderer::Post("tmp/post/example.html")
    post = Miyano.site.posts.first
    expect(post.name).to eql "example"
    expect(post.title).to eql "kramdown test example"
    expect(post.cre_date.strftime("%Y-%m-%d %H")).to\
                                      eql "2018-01-28 18"
    expect(post.mod_date.strftime("%Y-%m-%d %H")).to\
                                      eql "2018-02-04 12"
  end

  it "can generate html from post" do
    post = site.posts.first
    Miyano::Generator::Post(post, "tmp/site")
    expect(File.file?("tmp/site/example/index.html")).to eql true
  end

  it "can render template erb" do
    require "tilt/erb"
    template = Tilt::ERBTemplate.new("tmp/layout/index.html.erb")
    class Test
      attr_accessor :post
    end
    test = Test.new
    test.post = "hello world"
    output = template.render(test)
    expect(output).to eql "hello world"
  end

  it "can render template scss" do
    #require "sass"
    require "tilt/sass"
    path = "tmp/layout/default.css.scss"
    template = Tilt::ScssTemplate.new path
    css_path="tmp/site/#{File.basename(path, ".scss")}"
    File.open(css_path, "w") do |f|
      f.write template.render
    end
    expect(File.file?(css_path)).to eql true
  end

  it "can sort site.posts" do
    Miyano::Renderer::Post("tmp/post/new.html")
    expect(site.posts[0].mod_date > site.posts[1].mod_date).to eql false
    site.sort!
    expect(site.posts[0].mod_date > site.posts[1].mod_date).to eql true
  end

  it "fix the modified time from post" do
    post = Miyano::Post.new "tmp/post/3year.html"
    expect(post.mod_date.strftime("%Y-%m-%d %H")).to eql "2017-11-29 15"
  end

end




