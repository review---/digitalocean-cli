require 'spec_helper'

module DigitalOcean
  describe Settings do
    describe 'token' do
      it 'should return default value of nil' do
        s = Settings.new('/tmp')
        expect(s.load_token).to eq(nil)
      end
      it 'should save a token' do
        s = Settings.new('/tmp')
        s.save_token "A token"
        expect(s.load_token).to eq("A token")
      end
      it 'should delete the token' do
        s = Settings.new('/tmp')
        s.delete_token
        expect(s.load_token).to eq(nil)
      end
    end
  end
end
