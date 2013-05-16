module LoremFuckingIpsum
  class Server < Sinatra::Base
    get '/' do
      erb :index
    end

    get '/*' do
      redirect '/'
    end
  end
end
