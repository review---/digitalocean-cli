module DigitalOcean

  module Global

    def client
      # Initialized in pre-hook
      $global_client
    end

    def loggedIn?
      not DigitalOcean::Settings.new.load_token.nil?
    end

    def ensureLoggedIn
      raise 'Not logged in' unless loggedIn?
    end

  end

end
