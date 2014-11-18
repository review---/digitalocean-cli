require 'spec_helper'
include DigitalOcean::API

module DigitalOcean
  describe Image do
    before do
      Excon.stubs.clear
      @images = {
        :images => [
          {:name => 'i0', :id => 0},
          {:name => 'i1', :id => 1},
          {:name => 'i2', :id => 2}
          ]
        }.to_json
    end
    describe 'initialization' do
      it 'should contain 3 items' do
        Excon.stub(
          { :method => :get, :path => images },
          { :status => 200 , :body => @images })

        Image.each_with_index do |i,x|
          expect(i.name).to eq("i#{x}")
          expect(i.id).to eq(x)
        end
      end
    end
  end
end
