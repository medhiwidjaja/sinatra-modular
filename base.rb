require "sinatra/base"
require "sinatra/reloader"
require "sinatra/config_file"

# Set default env
ENV['RACK_ENV'] ||= 'development'
ENV['ROOT_PATH'] = "#{File.expand_path(File.dirname(__FILE__))}"

class Base < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::ConfigFile
  config_file "#{ENV['ROOT_PATH']}/config/config.yml"
end
