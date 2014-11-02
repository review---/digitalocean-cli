require 'digitalocean-cli'

RSpec.configure do |config|
  config.before(:each) do
    $global_client = DigitalOcean::Client.new(Excon.new('https://localhost', :mock => true), '42')
  end
end
