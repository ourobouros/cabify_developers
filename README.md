# Cabify Developer Site

## Jekyll

The developer site uses github's `jekyll` project to build and prepare the raw documentation. Be sure you have it installed before starting:

```
bundle install
```

## Start the server

```
bundle exec jekyll serve --watch --baseurl=
```

## Publish

We're using the gh-pages branch to publish contents.

```
git push origin master:gh-pages
```

## Markdown

We use kramdown as a markdown parser. Check here for options: http://kramdown.gettalong.org/syntax.html
