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
end
