require 'digitalocean-cli/api.rb'
require 'digitalocean-cli/client.rb'
require 'digitalocean-cli/droplet.rb'
require 'digitalocean-cli/global.rb'
require 'digitalocean-cli/image.rb'
require 'digitalocean-cli/settings.rb'
require 'digitalocean-cli/version.rb'

# Add requires for other files you add to your project here, so
# you just need to require this one file in your bin file
require 'excon'
require 'json'

include DigitalOcean::Global
