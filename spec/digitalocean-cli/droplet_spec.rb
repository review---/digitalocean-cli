require 'spec_helper'
include DigitalOcean::API

module DigitalOcean
  describe Droplet do
    before do
      Excon.stubs.clear
    end
    describe 'initialization' do
      it 'should require a name' do
        expect{ Droplet.new({}) }.to raise_error
      end
      it 'should set the passed name' do
        Excon.stub(
          { :method => :post, :path => droplets },
          { :status => 202 , :body => '{"droplet":{"id":42}}' })

        d = Droplet.new(:name => 'foo')
        expect(d.name).to eq('foo')
        expect(d.id).to eq(42)
      end
    end
    describe 'iteration' do
      it 'should contain 3 items' do
        Excon.stub(
          { :method => :get, :path => droplets },
          { :status => 200 , :body => '{"droplets":[{"name":"d0","id":0},{"name":"d1","id":1},{"name":"d2","id":2}]}' })

        Droplet.each_with_index do |d,i|
          expect(d.name).to eq("d#{i}")
          expect(d.id).to eq(i)
        end
      end
    end
    describe 'destruction' do
      it 'should set the passed name' do
        Excon.stub(
          { :method => :post, :path => droplets },
          { :status => 202 , :body => '{"droplet":{"id":42}}' })
        Excon.stub(
          { :method => :delete, :path => droplets+'/42'},
          { :status => 204 })

        d = Droplet.new(:name => 'foo')
        d.destroy
      end
    end
  end
end
