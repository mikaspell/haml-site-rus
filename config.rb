###
# Page options, layouts, aliases and proxies
###

require 'middleman-syntax'
require 'middleman-deploy'

# General configuration

activate :directory_indexes
activate :syntax
activate :relative_assets

set :haml, { :ugly => true, :format => :html5 }
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :css_dir,    'assets/css'
set :js_dir,     'assets/js'
set :images_dir, 'assets/img'

# Per-page layout changes:
#
# With no layout
# page '/*.xml', layout: false

# With alternative layout
page '/*.html', layout: :main
page "/documentation/*", :layout => :docs, :directory_index => false


# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

set :haml, :pretty => true

###
# Helpers
###

helpers do
  def is_page_active(page)
    current_page.url == page ? {:class => 'active'} : {}
  end
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do

  activate :robots, :rules => [
    {:user_agent => '*', :allow => %w(/)}
  ]

  set :relative_links, true

  compass_config do |config|
    config.output_style = :compact
    config.line_comments = false
  end
end
