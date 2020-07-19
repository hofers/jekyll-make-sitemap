require 'jekyll'

module Jekyll 
  module Make
    class Sitemap
      class Error < StandardError; end
      class << self
        def generate(site, payload, file)
          default_config = { 'pages' => true, 'posts' => true, 'environments' => ['production'] }
          config = site.config.has_key?("jekyll-make-sitemap") ? site.config["jekyll-make-sitemap"] : default_config
          if config['environments'].include?(payload.jekyll.environment)
            baseurl = site.config["url"]
            collections = config.has_key?("collections") ? config["collections"] : []
            unless config.has_key?("pages") && config["pages"] == false
              payload.site.pages.each do |page| process(file, page, baseurl) end
            end
            unless config.has_key?("posts") && config["posts"] == false
              payload.site.posts.each do |post|
                if !config["posts"].eql?(true)
                  config["posts"].each do |cat|
                    if post.data.has_key?("categories") && post.data["categories"].include?(cat)
                      process(file, post, baseurl)
                    end
                  end
                else
                  process(file, post, baseurl) 
                end
              end
            end
            collections.each do |col|
              site.collections[col].docs.each do |post| process(file, post, baseurl) end
            end
          end
        end
        def process(file, doc, baseurl)
          if !((doc.data.has_key?("tags") && doc.data["tags"].include?("sitemap-exclude")) || !doc.path.end_with?(".md"))
            file.write "#{baseurl}#{doc.url}\n"
          end
        end
      end
    end
  end
end

Jekyll::Hooks.register :site, :after_reset do |site|
  File.new("sitemap.txt", "w") if !File.exist?("sitemap.txt")
end

Jekyll::Hooks.register :site, :post_render do |site, payload|
  file = File.open("sitemap.txt", "w+")
  Jekyll::Make::Sitemap.generate(site, payload, file)
  file.close
end

Jekyll::Hooks.register :site, :post_write do |site|
  File.delete("sitemap.txt")
end