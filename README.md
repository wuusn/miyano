# Miyano

This small tool is designed for [Bear](http://www.bear-writer.com) lovers.

Focus on the right thing - writing the content.

To use this tool, you need to export your bearnotes and run some simple commands in the Terminal App.

## Requirements

- MacOS
- [Ruby >= 2.5.0](https://gorails.com/setup/osx/10.13-high-sierra/#ruby)

## Installation

    $ gem install miyano

## Usage

### About the commands
    $ miyano help
    Commands:
      miyano build           # build posts and layouts
      miyano help [COMMAND]  # Describe available commands or one specific command
      miyano new [DIR]       # create new blog
      miyano push            # push to Github Pages
      miyano try             # try as a local web server
      miyano version         # show version

### Create new blog

    $ miyano new myblog

If you use Bear in **Markdown Compatibility Mode**, use option `-m`

    $ miyano new myblog -m

### Change dir

    $ cd myblog
    
### Open Bear App and Export your selected notes into the Post Dictionary

### Build and Try it

    $ miyano build // convert the bearnotes to html files

    $ miyano try // start a local server
    
Or  

    $ miyano build; miyano try

Then open browser and go to `localhost:8000`
`Ctrl + C` to Quit

### Serve at Github Pages

    $ miyano push

### Serve at VPS 

You need to config the *git* server at your VPS to sync the static html files, and `miyano push` to that server.
Then don't use the `miyano try` as a Web Server, use `Nginx` as a proxy instead.

### Themes

For programmers.(Html, Css, and Basic OOP)

The `layout` folder determines how the blog looks like. 
I use `erb` as a template.

The `index.html.erb` has the instance of Class `Site`, check the methods you can use in the source [lib/miyano/site.rb](https://github.com/wuusn/miyano/blob/master/lib/miyano/site.rb).

Similarly, the `post.html.erb` has a instance of Class `Post`, check [lib/miyano/post.rb](https://github.com/wuusn/miyano/blob/master/lib/miyano/post.rb).

Check more on the [Wiki Page](https://github.com/wuusn/miyano/wiki/Theme-and-Layout)

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
