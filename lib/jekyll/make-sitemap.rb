require "jekyll"

module Jekyll 
  class MakeSitemap
    class << self
      def generate(site, payload)
        if payload.jekyll.environment == "production"
          default_config = { 'pages' => true, 'posts' => true }
          file = File.open("sitemap.txt", "w+")
          config = site.config.has_key?("jekyll-make-sitemap") ? site.config["jekyll-make-sitemap"] : default_config
          baseurl = site.config["url"]
          collections = config.has_key?("collections") ? ["collections"] : []

          unless config.has_key?("pages") && config["pages"] == false
            payload.site.pages.each do |page| process(file, page, baseurl) end
          end
          unless config.has_key?("posts") && config["posts"] == false
            payload.site.posts.each do |post| process(file, post, baseurl) end
          end
          collections.each do |col|
            site.collections[col].docs.each do |post| process(file, post, baseurl) end
          end

          file.close()
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

Jekyll::Hooks.register :site, :after_init do |site|
  File.new("sitemap.txt", "w")
end

Jekyll::Hooks.register :site, :pre_render do |site, payload|
  Jekyll::MakeSitemap.generate(site, payload)
end