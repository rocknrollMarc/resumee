# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

require 'maruku'
require 'makepdf'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page 'index.html', layout: false

helpers do
  def display_date(date)
    if date.is_a?(Date)
      date.strftime("%e %B %Y")
    else
      date
    end
  end
end

helpers do
  def display_age(birthday)
    now = Date.today
    now.year - birthday.year - (Date.new(now.year, birthday.month, birthday.day) > now ? 1 : 0)
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :relative_assets
  activate :pdfmaker
end

activate :deploy do |deploy|
  deploy.method = :git
end

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript, compressor: Terser.new
# end
