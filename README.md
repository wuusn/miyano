# Miyano

See example https://yuxin.io

See guide https://yuxin.io/introduce_miyano/

Not a big thing like [Jekyll](https://jekyllrb.com) which makes you feel free to deep DIY you blog.

The big thing brings free but also along with the complex, which needs you to pay more attention to the
attributes or the property of the post to adapt to the blog system every time you write a post than the **content** itself which is matter.

This small tool is designed for [Bear}(http://www.bear-writer.com) lovers.

Focus on the right thing - writing the content.

## Installation

    $ gem install miyano

## Usage

### Create new blog

    $ miyano new myblog

    ::For Markdown Compatibility Mode::

	$ miyano new myblog -m

### Change dir

    $ cd myblog

### Build and Try it

    $ miyano build

    $ miyano try

Then open browser and go to `localhost:8000`

### Push to Github Pages

#### not support Project Pages

    $ miyano push

#### miyano not miyabo

## Tips

### Just Miyano

Specify your blog's root and Save your time.

First, create a file named `.miyano` at your **home** directory.

Then, open it and write in the **absolute address of your blog** like `/Users/dandy/where/is/myblog`

Save and quit.

After that Miyano will remember your blog directory,

Once you want to update your blog, just type 6 letters `miyano`,

you don't need to `cd` and `miyano push` again and again.

It saves my time.

NOTE: just `miyano` can use in this way, the other commands `miyano [push|build|try]` cannot use in this way.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wuusn/miyano.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
