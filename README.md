# [jekyll-make-sitemap](https://rubygems.org/gems/jekyll-make-sitemap)
[![Gem Version](https://badge.fury.io/rb/jekyll-make-sitemap.svg)](https://badge.fury.io/rb/jekyll-make-sitemap)

Description

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
...
plugins:
  - jekyll-make-sitemap
...
jekyll-make-sitemap:
  pages: true       # Default: true
  posts: true       # Default: true
  collections: 
   - collection_1   # include items from collection_1 in sitemap
```

## Exceptions
To exclude a page or post, assign it the `sitemap-exclude` tag

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the jekyll-make-sitemap project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hofers/jekyll-make-sitemap/blob/master/CODE_OF_CONDUCT.md).
