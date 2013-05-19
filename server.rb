module LoremFuckingIpsum
  class Server < Sinatra::Base
    get '/' do
      haml :index
    end

    get '/api/generate' do
      static_start    = params[:static_start] == "true"
      paragraphs      = (params[:paragraphs] || 4).to_i
      profanity_level = (params[:profanity_level] || 40).to_i

      content_type 'text/plain'
      LoremIpsumGenerator.generate paragraphs, profanity_level, static_start
    end

    helpers do
      def share_bar
        <<-STR
<!--ShareBar.net BEGINS-->
<style>#ShareBar{top: 10%;width:60px;padding-left:10px;right: 0 !important;overflow:hidden;position: fixed;z-index: 100000;text-align:center;line-height:normal;_position: absolute;font-size:11px;font-family:Arial;}#ShareBar a,#ShareBar a:hover,#ShareBar a:visited{text-decoration:none;font-size:11px;}#e{float:left;margin-top:10px;position:relative;}#e:hover{margin-left:-7px;}</style><div id="ShareBar"><div id="e"><iframe style="height:63px; border:none; overflow:hidden; width:48px;" src="http://www.facebook.com/plugins/like.php?app_id=141440452603597&amp;href=http://www.loremfuckingipsum.org/&amp;send=false&amp;layout=box_count&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;locale=en_US" scrolling="no" frameborder="0" allowTransparency="true"></iframe></div><div id="e"><script type="text/javascript" src="http://apis.google.com/js/plusone.js"></script><g:plusone size="tall" href="http://www.loremfuckingipsum.org/"></g:plusone></div><div id="e"><script src="http://www.stumbleupon.com/hostedbadge.php?s=5&amp;r=http://www.loremfuckingipsum.org/"></script></div><div id="e"><script type="text/javascript">reddit_url = "http://www.loremfuckingipsum.org/";</script><script type="text/javascript" src="http://www.reddit.com/static/button/button2.js"></script></div><div id="e"><iframe src="http://getmailcounter.com/mailcounter/?url=http://www.loremfuckingipsum.org/&title=http://www.loremfuckingipsum.org/" height="64" width="50" frameborder="0" scrolling="no"></iframe></div><div id="e"><a href="http://twitter.com/share" class="twitter-share-button" data-count="vertical" data-url="http://www.loremfuckingipsum.org/">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script></div><div id="e"><script type="text/javascript" src="http://platform.linkedin.com/in.js"></script><script type="in/share" data-counter="top" data-url="http://www.loremfuckingipsum.org/"></script></div><div id="e" style="color:#000000; font-family:Arial, Helvetica, sans-serif; background-color:#F4295C; padding:2px 7px;"><a href="http://sharebar.net" title="Share Bar" target="_blank"><font color="#ffffff">Share</font><font color="#000000">Bar</font></a></div></div>
<!--ShareBar.net ENDS-->
        STR
      end

      def api_path
        request.host+":"+request.port.to_s+"/api/generate"
      end
    end
  end
end
