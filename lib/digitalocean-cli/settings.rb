require 'fileutils'

module DigitalOcean

  class Settings

    SETTINGS_FOLDER = '.digitalocean'
    TOKEN_FILE = 'token'

    def initialize(base_folder = Dir.home)
      @settings_folder = File.join(base_folder, SETTINGS_FOLDER)
      @token_file = File.join(@settings_folder, TOKEN_FILE)
    end

    def save_token(token)
      ensure_settings_folder
      File.open(@token_file, 'w') { |f| f.write token }
    end

    def load_token
      return nil unless File.file?(@token_file)
      user_name = File.read(@token_file)
    end

    def delete_token
      File.delete(@token_file) if File.exists?(@token_file)
    end

    private

    def ensure_settings_folder
      FileUtils.mkdir_p(@settings_folder) unless Dir.exists?(@settings_folder)
    end

  end

end
