# [jekyll-make-sitemap](https://rubygems.org/gems/jekyll-make-sitemap)
[![Gem Version](https://badge.fury.io/rb/jekyll-make-sitemap.svg)](https://badge.fury.io/rb/jekyll-make-sitemap)

A Jekyll hook plugin for generating a `sitemap.txt` file during the Jekyll build process. If you're interested in generating an XML sitemap I recommend checking out [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap).

This plugin includes all pages and posts by default. See the [Configuration](#Configuration) section for more on configuring your sitemap. 

## Installation
``` 
gem install jekyll-make-sitemap
```

## Set Up
In `Gemfile`
``` ruby
...
group :jekyll_plugins do
  ...
  gem 'jekyll-make-sitemap'
end
```

## Configuration
In `_config.yml`
``` yaml
jekyll-make-sitemap:
  pages: true       # Default: true
  posts: true       # Default: true
  environments:     # Default: ['production']
   - production 
   - development
  collections:      # Default: []
   - collection_1   # include items from collection_1 in sitemap
```

### Exceptions
To exclude a page or post, assign it the `sitemap-exclude` tag

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the jekyll-make-sitemap project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hofers/jekyll-make-sitemap/blob/master/CODE_OF_CONDUCT.md).
