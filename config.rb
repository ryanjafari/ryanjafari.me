###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page '/goals/*', layout: :goals
# page '/case_studies/*', layout: :case_studies
# page '/company/*', layout: :company

# Disable pretty URLs for blog archive
page '/archive/*', directory_index: false

# Disable layout and pretty URLs for sitemap
page '/sitemap.xml', layout: false, directory_index: false

# A path which all have the same layout
# with_layout :benefits do
#   page "/benefits/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#
# end

###
# Application Config
###

if File.exists?('.s3_sync')
  APP_CONFIG = YAML.load_file('.s3_sync')
else
  puts "WARNING: could not find an '.s3_sync' file in the root
        directory. You will not be able to deploy properly without one."
  APP_CONFIG = {}
end

require 'slim'

activate :livereload

# Middleman can produce gripped versions of your HTML, CSS, and JavaScript
activate :gzip

activate :syntax, css_class: 'codehilite'

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, layout_engine: :erb

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

activate :bower

set :automatic_directory_matcher, '--'

set :relative_links, true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Minify HTML on build
  #activate :minify_html

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress images after build
  # TODO: are we using svgo & pngout? check output
  activate :imageoptim do |imageoptim|
    imageoptim.verbose = true
  end

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # activate :favicon_maker do |f|
  #   f.template_dir  = File.join(root, 'source/assets/images')
  #   f.icons = {
  #     'favicon_template.png' => [
  #       { icon: 'apple-touch-icon-152x152-precomposed.png' },
  #       { icon: 'apple-touch-icon-144x144-precomposed.png' },
  #       { icon: 'apple-touch-icon-120x120-precomposed.png' },
  #       { icon: 'apple-touch-icon-114x114-precomposed.png' },
  #       { icon: 'apple-touch-icon-76x76-precomposed.png' },
  #       { icon: 'apple-touch-icon-72x72-precomposed.png' },
  #       { icon: 'apple-touch-icon-60x60-precomposed.png' },
  #       { icon: 'apple-touch-icon-57x57-precomposed.png' },
  #       { icon: 'apple-touch-icon-precomposed.png', size: '57x57' },
  #       { icon: 'favicon-196x196.png' },
  #       { icon: 'favicon-160x160.png' },
  #       { icon: 'favicon-96x96.png' },
  #       { icon: 'favicon-32x32.png' },
  #       { icon: 'favicon-16x16.png' },
  #       { icon: 'favicon.png', size: '16x16' },
  #       { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
  #       { icon: 'mstile-144x144', format: 'png' }
  #     ]
  #   }
  # end
end

# This is so we can put links in markdown
Slim::Engine.set_default_options disable_escape: true

# Google Analytics
if build?
  use Rack::GoogleAnalytics,
      tracker: 'UA-48873113-1',
      multiple: true,
      domain: 'ryanjafari.me',
      enhanced_link_attribution: true

  # Activate Disqus extension
  activate :disqus do |d|
    d.shortname = 'ryanjafari'
  end
end

# Deployment to Amazon S3
activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'ryanjafari.me'
  s3_sync.region                     = 'us-east-1'
  s3_sync.delete                     = true
  s3_sync.after_build                = false
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
end

###
# Amazon S3 object-level redirection
###

# activate :s3_redirect do |s3_redirect|
#   s3_redirect.bucket                = 'ryanjafari.me'
#   s3_redirect.region                = 'us-east-1'
#   s3_redirect.aws_access_key_id     = APP_CONFIG['aws_access_key_id']
#   s3_redirect.aws_secret_access_key = APP_CONFIG['aws_secret_access_key']
#   s3_redirect.after_build           = true
# end

# redirect '/', 'http://ryanandcarlos.com/'

###
# Blog settings
###

Time.zone = 'US/Eastern'

activate :blog do |blog|
  blog.prefix = 'articles'
  # blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = 'article'
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/:num'
end

# You can use the Directory Indexes feature to tell Middleman to create a
# folder for each .html file and place the built template file as the index
# of that folder.
activate :directory_indexes

page 'feed.xml', layout: false
