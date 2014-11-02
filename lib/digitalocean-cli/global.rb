module DigitalOcean

  module Global

    def client
      # Initialized in pre-hook
      $global_client
    end

  end

end
