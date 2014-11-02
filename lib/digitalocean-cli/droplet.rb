module DigitalOcean

  class Droplet

    def initialize(params)
      raise "Missing droplet name" if params[:name].nil?
      @name = params[:name]
    end

    def name
      @name
    end

  end

end
