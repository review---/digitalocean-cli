module DigitalOcean

  class Image

    def self.all
      client.get(images)['images'].map{ |i| Image.new(i) }
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
      @id = params['id']
      @name = params['name']
      @distribution = params['distribution']
      @slug = params['slug']
    end

    def id
      @id
    end

    def name
      @name
    end

    def distribution
      @distribution
    end

    def slug
      @slug
    end

  end

end
