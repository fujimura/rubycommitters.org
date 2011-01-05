module AccountsHelper
  def link_to_service name, service

    base_uri = case service.name
               when 'twitter'
                 'http://twitter.com/'
               when 'friendfeed'
                 'http://friendfeed.com/'
               when 'mixi'
                 'http://mixi.jp/show_friend.pl?id='
               when 'github'
                 'http://github.com/'
               when 'facebook'
                 if service.key =~ /^\sd+$/
                   'http://www.facebook.com/profile.php?id='
                 else
                   'http://www.facebook.com/'
                 end
               when 'iddy'
                 'http://iddy.jp/profile/'
               end

    text = if %w(mixi twitter friendfeed github facebook).include? service.name
             image_tag("/images/#{service.name}_32.png")
           else
             name
           end

    link_to text, base_uri + service.key
  end
end
