Sass::Plugin.options[:style] = Rails.env.development? ? :compact : :compressed
Sass::Plugin.options[:template_location] = 'app/stylesheets'
