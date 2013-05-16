module LoremFuckingIpsum
  class Server < Sinatra::Base
    get '/' do
      haml :index
    end

    get '/api/generate' do
      static_start    = params[:static_start]
      paragraphs      = (params[:paragraphs] || 4).to_i
      profanity_level = (params[:profanity_level] || 40).to_i

      content_type 'text/plain'
      LoremIpsumGenerator.generate paragraphs, profanity_level, static_start
    end
  end
end
