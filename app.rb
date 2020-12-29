require "sinatra/base"
require "sinatra/namespace"
require "sinatra/json"
require_relative "base"

class App < Base
  register Sinatra::Namespace

  get "/" do
    slim :index
  end
  
  namespace '/api/v1' do
    get "/info" do
      json :app_name => settings.app_name
    end
  end

  helpers do
    def partial(page, options={})
      slim page.to_sym, options.merge!(:layout => false)
    end
  end
end
