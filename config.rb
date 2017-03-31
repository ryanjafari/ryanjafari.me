# Disable pretty URLs for blog archive
page '/archive/*', directory_index: false

# Disable layout and pretty URLs for sitemap
page 'sitemap.xml', layout: false

# Disable layout for RSS feed
page 'feed.xml', layout: false

activate :automatic_image_sizes

# This is so we can put links in markdown
Slim::Engine.set_options disable_escape: true

activate :livereload

activate :syntax, css_class: 'codehilite'

set :markdown_engine, :redcarpet
set :markdown,  no_intra_emphasis: true,
                tables: true,
                fenced_code_blocks: true,
                autolink: true,
                disable_indented_code_blocks: true,
                strikethrough: true,
                lax_spacing: false,
                space_after_headers: true,
                superscript: true,
                highlight: true,
                quote: true,
                footnotes: true,
                smartypants: true,
                layout_engine: :erb

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

activate :sprockets

after_configuration do
  @bower_config = JSON.parse IO.read("#{root}/.bowerrc")
  sprockets.append_path File.join(root, @bower_config["directory"])
end

set :automatic_directory_matcher, '--'

set :relative_links, true

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  # activate :cache_buster # Old method; for backup
  activate :asset_hash
  activate :relative_assets
  activate :imageoptim
end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-48873113-1'
  ga.domain_name = 'ryanjafari.me'
  ga.enhanced_link_attribution = true
  ga.debug = true
  ga.disable = false
  ga.test = true
end

if build?
  activate :disqus do |d|
    d.shortname = 'ryanjafari'
  end
end

Time.zone = 'US/Eastern'

activate :blog do |blog|
  blog.name = 'blog'
  blog.prefix = 'blog'
  # blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = 'article'
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.year_link = '/calendar/:year.html'
  blog.month_link = '/calendar/:year/:month.html'
  blog.day_link = '/calendar/:year/:month/:day.html'
  blog.default_extension = ".markdown"
  blog.tag_template = 'templates/tag.html'
  blog.calendar_template = 'templates/calendar.html'
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/:num'
end

activate :blog do |blog|
  blog.name = 'projects'
  blog.prefix = 'projects'
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/:num'
end

# You can use the Directory Indexes feature to tell Middleman to create a
# folder for each .html file and place the built template file as the index
# of that folder.
activate :directory_indexes
