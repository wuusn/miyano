# Miyano

See example https://yuxin.io

I treat this as an extension for my love [Bear App](http://www.bear-writer.com).

Let me focus on writting the right thing. Once setup, the blog system will never distract you.

Say goodbye to [Yaml Front Matter](https://jekyllrb.com/docs/frontmatter/). (setting up title, tags, date berfore the content everytime)

Say goodbye to dealing with the files manually. (pictures and markdown files)

Say goodbye to ugly writting experience.

Say goodbye to COMPLEX and USELESS.

Just export bearnote files and deploy them on Github Pages.

Just focus on writting...

Isn't that cool?

## Installation

    $ gem install miyano

## Usage

I wrote an [introduce](https://yuxin.io/introduce_miyano/) in Chinese.

### Create new blog

    $ miyano new myblog

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
