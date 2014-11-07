module DigitalOcean

  class Client

    def initialize(connection, auth_token)
      @connection = connection
      @auth_token = auth_token
    end

    def get(path, expects=[200])
      res = @connection.get( :expects => expects,
                             :path => path,
                             :headers => {
                               'Authorization' => "Bearer #{@auth_token}",
                             })
      return parse(res)
    end

    def post(path, data, expects=[201,202])
      res = @connection.post( :expects => expects,
                              :path => path,
                              :headers => {
                                'Authorization' => "Bearer #{@auth_token}",
                                'Content-Type' => 'application/json' },
                              :body => data
                              )
      return parse(res)
    end

    def delete(path, expects=[204])
      res = @connection.delete( :expects => expects,
                                :path => path,
                                :headers => {
                                  'Authorization' => "Bearer #{@auth_token}",
                                  'Content-Type' => 'application/x-www-form-urlencoded',
                                })
      return parse(res)
    end

    def parse(response)
      return '' if response.body.empty?
      begin
        return JSON.parse(response.body)
      rescue JSON::ParserError => e
        raise "Failed to parse JSON: #{e}"
      end
    end

  end

end
