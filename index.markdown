[Home](./index.html)        [FAQ](./faq.html)        [Contact](./contact.html)

# Minimalist Markdown Site

The barrier of entry to becoming a web developer have [never been lower](https://twitter.com/levelsio/status/1022787055951077376). Hardware is cheap, knowledge is shared freely (which is different from a few centuries ago where you'd have to learn Latin and get permission to view the valuable books to gain access to knowledge). Enough of my friends were "learning to code" by crafting HTML using notepad.exe on the shared family computer back in the day (and I'm not that old) that now, with the flood of new hardware and ease of finding tutorials online, *everyone* should be trying it.

But they're not.

This is a rant but also a tutorial on how to build your own site like this, using Markdown.

Because web tooling is so complicated now that a beginner would believe that you couldn't publish your own web site without first learning Docker, and then Kubernetes, and then getting into some kind of debate around ES6, ES5, JavaScript, TypeScript, Node, React, Angular and Vue. And you'd need to learn git of course. And Jenkins and Ansible. And AWS. And AI. And. And. And.

You don't. And websites don't need to load 10MB of JavaScript to look pleasing.

You can write an HTML file like it's 1999. You can forget that closing paragraph mark. Open a text file on your computer, write `<html><body><h1>Hello, World!</h1></body></html>` in it and open in your web browser. That's a web page. You can link it to other web pages. You can upload it (via FTP if you have to) to a free service and have it displayed to the world.

But HTML is a pain to write. If you want to write and maintain on a regular basis, you're going to get tired of balancing those `<p>` tags eventually. 

## Pandoc

[Pandoc](http://pandoc.org) is a magic tool that converts any document format to any other. You should install it on whatever operating system that you're using (probably something that's using more RAM to keep your web browser open so that you can read this page than we needed to run all the machines powering all the banks in the world not too long ago).
Now create a directory for your website. The one I just created to make this is called `minimalist-markdown-site`. You can call yours whatever you like.

Create a text file in the directory. Call it "index.markdown". Write text in it using Markdown syntax. You don't need to learn markdown syntax because you can just write paragraphs. If you want a heading at the top write `# My heading`. If you want bold add some `**asterisks**` (**asterisks**) around the word(s) you want bolded. If you want more than that, go read a Markdown tutorial. 

Add some links to other pages to the top of your markdown file. A website needs a menu or you might get confused with all the people writing SPAs in whatever JavaScript framework is going to output 10MB files and be obsolete by tomorrow. You can do this as follows:

`[Home](./index.html) [FAQ](./faq.html) [Contact](./contact.html)`.

Now create the files `faq.markdown` and `contact.markdown` and make sure they match the names you used in the header (with a `.markdown` extension instead of `.html`). 

Copy and paste the same header into them. We can worry about templating another time. You're going to waste more time choosing a templating engine than copy-pasting a single line header into 3-20 files. You can write a script to modify your markdown files "manually" if you need to.

Now create a directory called `html` next to all your markdown files. Inside that, create a file called `perfect.css`. Add the following to it:

```
body{
max-width:650px;
margin:40px auto;
padding:0 10px;
font:18px/1.5 -apple-system,BlinkMacSystemFont,"avenir next",avenir,
"Segoe UI","lucida grande","helvetica neue",helvetica,
"Fira Sans",roboto,noto,"Droid Sans",cantarell,oxygen,ubuntu,
"franklin gothic medium","century gothic",
"Liberation Sans",
sans-serif;color:#444}h1,h2,h3{line-height:1.2}
```

(stolen shamelessly from [here](https://perfectmotherfuckingwebsite.com) (profanity warning)

Now add any text you want to your `index.markdown`, `contact.markdown`, and `faq.markdown` files. 

Now create a `build.sh` script (you'll need to adapt this if you're using Windows). Add the following code to `build.sh`:


```
FILES=*.markdown
for f in $FILES
do
  filename="${f%.*}"
  echo "Converting $f to $filename.html"
  `pandoc $f -c perfect.css -o "./html/$filename.html" \
          -T "MinimalistMardownSite | $filename"`
done

```

If your Grandma told you not to run bash scripts from the internet, she's right. But read this and change it if you need. It finds all markdown files (line 1), loops through them (line 2), prepares to do something to them (line 3), extracts the filename for each (line 4), tells you which file it's processing (line 5), calls pandoc to convert your markdown file to and html file, giving it a title and including the CSS file we wrote (lines 6-7), and finishes (line 8). You don't even need to pay for a $100/month SEO tool now because we appended the file name, which is also the page name, to the title, along with the site name (you'll want to change "MinimalistMarkdownSite" to something else). 

You can run pandoc by hand if you want instead of writing this 7 line script, but automation is nice and I wanted this page to be a bit longer.

Save the script and run `sh build.sh` in your terminal (after `cd`ing to the correct directory). You'll get your website ready for deployment in the `html` directory. You can upload it via FTP if you want. You can open it locally and click around. It will look just like this website.
