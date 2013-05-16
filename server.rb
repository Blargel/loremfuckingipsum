module LoremFuckingIpsum
  class Server < Sinatra::Base
    get '/' do
      erb :index
    end

    get '/api/generate' do
      paragraphs =      (params[:paragraphs] || 4).to_i
      profanity_level = (params[:profanity_level] || 40).to_i

      content_type 'text/plain'
      LoremIpsumGenerator.generate paragraphs, profanity_level
    end
  end
end
