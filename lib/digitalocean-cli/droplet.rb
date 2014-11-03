module DigitalOcean

  class Droplet

    def self.each
      body = client.get(droplets)
      body['droplets'].map{ |d| DigitalOcean::Droplet.new(d) }.each do |d|
        yield d
      end
    end

    def initialize(params)
      raise 'Missing droplet name' if params[:name].nil? && params['name'].nil?
      @name = params[:name] || params['name']
      @cloudconfig = params[:cloudconfig]
      @status = params[:status] || params['status'] || 'unknown'
      @id = params[:id] || params['id']
      if @id.nil?
        data = '{"name":"'+@name+'","region":"ams3","size":"512mb","image":7111572,"user_data":"'+@cloudconfig+'"}'
        res = client.post(droplets, data)
        @id = res['droplet']['id']
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

    def destroy
      client.delete("#{droplets}/#{@id}")
    end

  end

end
