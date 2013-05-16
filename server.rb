module LoremFuckingIpsum
  class Server < Sinatra::Base
    get '/' do
      erb :index
    end

    get '/api/generate' do
      content_type 'text/plain'
      LoremIpsumGenerator.generate
    end
  end
end
