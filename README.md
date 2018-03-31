# Miyano

Example(my blog): https://yuxin.io

Not a big thing like [Jekyll](https://jekyllrb.com) which lets you feel free to deep DIY you blog.

The big thing brings free but also along with the complex.

This small tool is designed for [Bear](http://www.bear-writer.com) lovers.

Focus on the right thing - writing the content.

## Requirements

- MacOS
- Ruby >= 2.5.0

## Installation

    $ gem install miyano

## Usage

### Create new blog

    $ miyano new myblog

If you use Bear in **Markdown Compatibility Mode**, use option `-m`

    $ miyano new myblog -m

### Change dir

    $ cd myblog

### Build and Try it

    $ miyano Build // convert the bearnotes to html files

    $ miyano try // start a local server

Then open browser and go to `localhost:8000`
`Ctrl + C` to Quit

### Serve at Github Pages

    $ miyano push

### Serve at VPS (Not Recommended)
(cause it's not free and not stable as Github Pages)

You need to config the git server at the VPS, and `miyano push` to that server.
Then don't use the `miyano try` as a Web Server, use `Nginx` instead.

### Themes
Not friendly enough.

The `layout` folder determines how the blog looks like. 
I use `erb` as a template.

The `index.html.erb` has the instance of Class `Site`, check the methods you can use in the source [lib/miyano/site.rb](https://github.com/wuusn/miyano/blob/master/lib/miyano/site.rb).

Similarly, the `post.html.erb` has a instance of Class `Post`, check [lib/miyano/post.rb](https://github.com/wuusn/miyano/blob/master/lib/miyano/post.rb).


## Parser of  Polar Bear Markup Language
I made these parsers, [beardown](https://github.com/wuusn/beardown) and [beardown-compat](https://github.com/wuusn/beardown-compat).

If you find any error render(different from the Bear App), contact me
or open an issue in [Beardown Issues](https://github.com/wuusn/beardown/issues)

## Join the Telegram Group to get support
[Miyano for Bear](https://t.me/m1yano)

## If you like it, please give a star to let me know

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wuusn/miyano.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
