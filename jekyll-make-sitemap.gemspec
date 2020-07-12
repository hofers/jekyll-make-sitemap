require_relative 'lib/jekyll/make/sitemap/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-make-sitemap"
  spec.version       = Jekyll::MakeSitemap::VERSION
  spec.authors       = ["Sean Hofer"]
  spec.email         = ["me@seanhofer.com"]

  spec.summary       = "A Jekyll hook for generating a sitemap.txt in production builds"
  spec.description   = "A Jekyll hook for generating a sitemap.txt in production builds"
  spec.homepage      = "https://github.com/hofers/jekyll-make-sitemap"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hofers/jekyll-make-sitemap"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/})  or f.match(/^jekyll-make-sitemap-\d\.\d\.\d\.gem$/) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
