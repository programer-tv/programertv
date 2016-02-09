module ApplicationHelper
  def disqus_script
    render_haml("<script>" +
      "(function(){" +
      "var dsq = document.createElement('script');" +
      "dsq.type = 'text/javascript';" +
      "dsq.async = true;" +
      "dsq.src = '//programertv.disqus.com/embed.js';" +
      "(document.getElementsByTagName('head')[0] || " +
      "document.getElementsByTagName('body')[0]).appendChild(dsq);" +
      "})();" +
      "</script>"
    )
  end

	def disqus_comments
    render_haml("<div id='disqus_thread'></div>")
	end

  def video_iframe(object)
    if object.video_host == "YouTube"
      render_haml(youtube + object.video_id + video_settings)
    elsif object.video_host == "Wistia"
      render_haml(wistia + object.video_id + video_settings)
    elsif object.video_host == "Vimeo"
      render_haml(vimeo + object.video_id + video_settings)
    end
  end

  def twitter_script
    render_haml("<script>" +
      "!function(d,s,id){" +
      "var js,fjs=d.getElementsByTagName(s)[0]," +
      "p=/^http:/.test(d.location)?'http':'https';" +
      "if(!d.getElementById(id)){" +
      "js=d.createElement(s);" +
      "js.id=id;" +
      "js.src=p+'://platform.twitter.com/widgets.js';" +
      "fjs.parentNode.insertBefore(js,fjs);}}" +
      "(document, 'script', 'twitter-wjs');</script>")
  end

  def twitter_button(page_path, title)
    render_haml("<a href='https://twitter.com/share' "+
      "class='twitter-share-button' " +
      "data-url='#{page_path}' " +
      "data-text='أنا أشاهد \"#{title}\"' " +
      "data-via='ProgramerTV' data-lang='ar'></a>")
  end

  def facebook_script
    render_haml("<div id='fb-root'></div>" +
      "<script>(function(d, s, id) {" +
      "var js, fjs = d.getElementsByTagName(s)[0];" +
      "if (d.getElementById(id)) return;" +
      "js = d.createElement(s); js.id = id;" +
      "js.src = 'https://connect.facebook.net/ar_AR/sdk.js#xfbml=1" +
      "&version=v2.5';" +
      "fjs.parentNode.insertBefore(js, fjs);" +
      "}(document, 'script', 'facebook-jssdk'));</script>")
  end

  def facebook_button(page_path)
    render_haml("<div class='fb-like' data-href='#{page_path}' " +
                "data-layout='button' data-action='like' " +
                "data-show-faces='false' data-share='false'></div>")
  end

  def get_user_avatar(user)
    if not user.provider.nil? and not user.image_link.nil?
      get_social_avatar(user)
    else
      get_gravatar(user)
    end
  end

	private

  def render_haml(code)
    engine = Haml::Engine.new(code)
    engine.render
  end

  def youtube
    "%iframe{ src: 'https://www.youtube.com/embed/"
  end

  def wistia
    "%iframe{ src: 'https://fast.wistia.net/embed/iframe/"
  end

  def vimeo
    "%iframe{ src: 'https://player.vimeo.com/video/"
  end

  def video_settings
    "', webkitallowfullscreen: true, " +
    "oallowfullscreen: true, " +
    "mozallowfullscreen: true, " +
    "msallowfullscreen: true, " +
    "allowfullscreen: true, " +
    "class: 'center-block' }"
  end

  def get_social_avatar(user)
    render_haml("<img src='#{user.image_link}' />")
  end

  def get_gravatar(user)
    digest = Digest::MD5.hexdigest(user.email)
    render_haml("<img src='https://gravatar.com/avatar/#{digest}?d=mm' />")
  end
end
