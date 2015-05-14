# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w(bootstrap.css animate.css font-awesome.min.css font.css plugin.css app.css
landing.css respond.min.js html5.js fix.js jquery.min.js bootstrap.js app.js app.plugin.js app.data.js jquery.slimscroll.min.js
jquery.sparkline.min.js jquery.easy-pie-chart.js raphael-min.js morris.min.js)

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#, 'animate.css','font-awesome.min.css',
#    'font.css','plugin.css','app.css', 'landing.css'