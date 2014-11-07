module DigitalOcean

  class Droplet

    def self.all
      client.get(droplets)['droplets'].map{ |d| Droplet.new(d) }
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
      @id = params[:id] || params['id']
      if @id.nil?
        raise 'Missing droplet name' if params[:name].nil?
        @name = params[:name]
        res = client.post(droplets, { :name => @name,
                                      :region => 'ams3',
                                      :size => '512mb',
                                      :image => 7111572,
                                      :user_data => params[:cloudconfig]
                                    }.to_json)
        @id = res['droplet']['id']
        @status = res['droplet']['status']
      else
        @name = params['name']
        @status = params['status']
      end
    end

    def id
      @id
    end

    def name
      @name
    end

    def status
      @status
    end

    def power_on
      client.post(droplet_actions(@id), {:type => 'power_on'}.to_json)
    end

    def power_off
      client.post(droplet_actions(@id), {:type => 'power_off'}.to_json)
    end

    def reboot
      client.post(droplet_actions(@id), {:type => 'reboot'}.to_json)
    end

    def destroy
      client.delete("#{droplets}/#{@id}")
    end

  end

end
