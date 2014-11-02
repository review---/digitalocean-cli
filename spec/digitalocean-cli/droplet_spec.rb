require 'digitalocean-cli'

module DigitalOcean
  describe Droplet do
    it 'should require a name' do
      expect{ Droplet.new({}) }.to raise_error
    end
    it 'should get the passed name' do
      d = Droplet.new(:name => 'foo')
      expect(d.name).to eq('foo')
    end
  end
end
