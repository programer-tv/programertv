module ApplicationHelper
  def page_title(title="")
    if title.empty?
      title = "programer.tv"
    else
      "programer.tv - " << title
    end
  end

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

  def tweet_video_button(title)
    render_haml("<a href='https://twitter.com/share' "+
      "class='twitter-share-button' " +
      "data-url='https://programer.tv' " +
      "data-text='أنا أشاهد \"#{title}\"' " +
      "data-via='ProgramerTV' data-lang='ar'></a>")
  end

  def tweet_article_button(title)
    render_haml("<a href='https://twitter.com/share' "+
      "class='twitter-share-button' " +
      "data-url='https://programer.tv' " +
      "data-text='أنا أقرأ \"#{title}\"' " +
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

  def get_user_avatar(user, size)
    if not user.provider.nil? and not user.image_link.nil?
      get_social_avatar(user, size)
    else
      get_gravatar(user, size)
    end
  end

  def google_analytics_script
    render_haml("<script>" +
      "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){" +
      "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o)," +
      "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)" +
      "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');" +
      "ga('create', 'UA-73229321-1', 'auto');" +
      "ga('send', 'pageview');" +
      "</script>"
    )
  end

  def google_verification_meta_tag
    render_haml("<meta name='google-site-verification' content='JR0_bcUI50cjMpWRB-630NrAfQ8rQGb9SPnnJns6kSI' />")
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

  def get_social_avatar(user, size)
    # render_haml("<img src='#{user.image_link}' />")
    image_tag user.image_link, size: size
  end

  def get_gravatar(user, size)
    digest = Digest::MD5.hexdigest(user.email)
    # render_haml("<img src='https://gravatar.com/avatar/#{digest}?d=mm' />")
    image_tag "https://gravatar.com/avatar/#{digest}?d=mm", size: size
  end
end
