require 'spec_helper'
include DigitalOcean::API

module DigitalOcean
  describe Droplet do
    before do
      Excon.stubs.clear
      @droplet = {
        :droplet => {:id => 42}
      }.to_json
      @droplets = {
        :droplets => [
          {:name => 'd0', :id => 0},
          {:name => 'd1', :id => 1},
          {:name => 'd2', :id => 2}
          ]
        }.to_json
    end
    describe 'initialization' do
      it 'should require a name' do
        expect{ Droplet.new({}) }.to raise_error
      end
      it 'should set the passed name' do
        Excon.stub(
          { :method => :post, :path => droplets },
          { :status => 202 , :body => @droplet })

        d = Droplet.new(:name => 'foo')
        expect(d.name).to eq('foo')
        expect(d.id).to eq(42)
      end
    end
    describe 'iteration' do
      it 'should contain 3 items' do
        Excon.stub(
          { :method => :get, :path => droplets },
          { :status => 200 , :body => @droplets })

        Droplet.each_with_index do |d,i|
          expect(d.name).to eq("d#{i}")
          expect(d.id).to eq(i)
        end
      end
    end
    describe 'power-cycle' do
      it 'should power on' do
        Excon.stub(
          { :method => :post, :path => droplets },
          { :status => 202 , :body => @droplet })
        Excon.stub(
          { :method => :post, :path => droplet_actions(42), :body => {:type => 'power_on'}.to_json },
          { :status => 201 })

        d = Droplet.new(:name => 'foo')
        d.power_on
      end
      it 'should power off' do
        Excon.stub(
          { :method => :post, :path => droplets },
          { :status => 202 , :body => @droplet })
        Excon.stub(
          { :method => :post, :path => droplet_actions(42), :body => {:type => 'power_off'}.to_json },
          { :status => 201 })

        d = Droplet.new(:name => 'foo')
        d.power_off
      end
      it 'should reboot' do
        Excon.stub(
          { :method => :post, :path => droplets },
          { :status => 202 , :body => @droplet })
        Excon.stub(
          { :method => :post, :path => droplet_actions(42), :body => {:type => 'reboot'}.to_json },
          { :status => 201 })

        d = Droplet.new(:name => 'foo')
        d.reboot
      end
    end
    describe 'destruction' do
      it 'should set the passed name' do
        Excon.stub(
          { :method => :post, :path => droplets },
          { :status => 202 , :body => @droplet })
        Excon.stub(
          { :method => :delete, :path => droplets+'/42'},
          { :status => 204 })

        d = Droplet.new(:name => 'foo')
        d.destroy
      end
    end
  end
end
