module DigitalOcean

  class Region

    def self.all
      client.get(regions)['regions'].map{ |i| Region.new(i) }
    end

    def self.each
      all.each do |d|
        yield d
      end
    end

    def self.each_with_index
      all.each_with_index do |d,i|
        yield d,i
      end
    end

    def initialize(params)
      @slug = params['slug']
      @name = params['name']
    end

    def slug
      @slug
    end

    def name
      @name
    end

  end

end
