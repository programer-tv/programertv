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

	private

  def render_haml(code)
    engine = Haml::Engine.new(code)
    engine.render
  end
end
