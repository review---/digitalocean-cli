module DigitalOcean

  module API
    def base_url() 'https://api.digitalocean.com' end
    def droplets() '/v2/droplets' end
  end

end
