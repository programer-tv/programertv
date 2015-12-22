require 'rails_helper'

describe ApplicationHelper, type: :helper do
  context "disqus" do
    it "renders script" do
			expect(disqus_script).to \
        eq("<script>" +
          "(function(){" +
          "var dsq = document.createElement('script');" +
          "dsq.type = 'text/javascript';" +
          "dsq.async = true;" +
          "dsq.src = '//programertv.disqus.com/embed.js';" +
          "(document.getElementsByTagName('head')[0] || " +
          "document.getElementsByTagName('body')[0]).appendChild(dsq);" +
          "})();" +
          "</script>\n")
    end

    it "render comments" do
			expect(disqus_comments).to eq("<div id='disqus_thread'></div>\n")
    end
  end
end
