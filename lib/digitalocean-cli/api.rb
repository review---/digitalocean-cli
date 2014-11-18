module DigitalOcean

  module API
    def base_url() 'https://api.digitalocean.com' end

    # Droplet
    def droplets() '/v2/droplets' end
    def droplet_actions(droplet_id) "/v2/droplets/#{droplet_id}/actions" end

    # Image
    def images() '/v2/images' end

    # Region
    def regions() '/v2/regions' end
  end

end
