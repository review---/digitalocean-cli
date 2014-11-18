require 'spec_helper'
include DigitalOcean::API

module DigitalOcean
  describe Region do
    before do
      Excon.stubs.clear
      @regions = {
        :regions => [
          {:name => 'New York 1', :slug => 'nyc1'},
          {:name => 'San Francisco 1', :slug => 'sfo1'},
          {:name => 'London 3', :slug => 'lon3'}
          ]
        }.to_json
    end
    describe 'initialization' do
      it 'should contain 3 items' do
        Excon.stub(
          { :method => :get, :path => regions },
          { :status => 200 , :body => @regions })

        regions = Region.all
        expect(regions[0].name).to eq('New York 1')
        expect(regions[0].slug).to eq('nyc1')
        expect(regions[1].name).to eq('San Francisco 1')
        expect(regions[1].slug).to eq('sfo1')
        expect(regions[2].name).to eq('London 3')
        expect(regions[2].slug).to eq('lon3')
      end
    end
  end
end
