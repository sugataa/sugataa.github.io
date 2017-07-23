###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

# Disable directory_index for 404 page
page '/404.html', directory_index: false

###
# Helpers and extensions
###

helpers do
  # Builds a page title from the article title + site title
  def page_title
    if current_article && current_article.title
      current_article.title + ' | ' + config[:site_title]
    else
      config[:site_title]
    end
  end
  # Renders component partials
  def component(path, locals={})
    partial "components/#{path}", locals
  end
end

activate :blog do |blog|
  blog.permalink = '{title}.html'
  # Matcher for blog source files
  blog.sources = 'articles/{year}-{month}-{day}-{title}.html'
  blog.layout = 'article'
  blog.default_extension = '.md'
end

# Markdown and syntax highlighting
activate :syntax
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

# Use commit time from git for sitemap.xml and feed.xml
activate :vcs_time

###
# Site settings
###
set :site_url, 'http://sugataa.github.io'
set :site_title, 'Sugata Acharjya'
set :site_subtitle, 'Smashing Life'
set :profile_text, %q(Hi, I'm Sugata.)
set :site_author, 'Sugata Acharjya'
set :site_subtitle, 'Code · Data · Vibes'
# Generate your own by running `rake id`
set :site_id, 'uri:uuid:be86ac8f-e8f7-45b8-b270-6742c40a82f9'

# Usernames
set :github_username, 'sugataa'
set :keybase_username, 'example'
set :twitter_username, 'example'
set :linkedin_username, 'sugata-acharjya-b8463051'
set :lastfm_username, 'example'
set :spotify_username, 'example'

# Replace 'nil' with your Disqus shortname, eg. 'example'
set :disqus_shortname, nil
# Replace 'nil' with your Google Analytics key, eg. 'XX-XXXXXXXX-X'
set :google_analytics, nil

###
# Environment settings
###
# Development-specific configuration
configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  # Improve cacheability by using asset hashes in filenames
  activate :asset_hash
end

activate :deploy do |deploy|
  deploy.build_before = true # runs build before deploying
  deploy.deploy_method = :git
  deploy.branch = 'master'
end
