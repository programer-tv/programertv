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

  context "video iframes" do
    it "displays YouTube iframe correctly in course show view" do
			course = create(:course, video_host: "YouTube", video_id: "12345")
        expect(video_iframe(course)).to \
          eq("<iframe allowfullscreen class='center-block' " +
            "mozallowfullscreen " +
            "msallowfullscreen oallowfullscreen " +
            "src='https://www.youtube.com/embed/12345' " +
            "webkitallowfullscreen></iframe>\n")
    end

    it "displays YouTube iframe correctly in episode show view" do
			episode = create(:episode, video_host: "YouTube", video_id: "12345")
        expect(video_iframe(episode)).to \
          eq("<iframe allowfullscreen class='center-block' " +
            "mozallowfullscreen " +
            "msallowfullscreen oallowfullscreen " +
            "src='https://www.youtube.com/embed/12345' " +
            "webkitallowfullscreen></iframe>\n")
    end

    it "displays Wistia iframe correctly in course show view" do
			course = create(:course, video_host: "Wistia", video_id: "12345")
        expect(video_iframe(course)).to \
          eq("<iframe allowfullscreen class='center-block' " +
            "mozallowfullscreen " +
            "msallowfullscreen oallowfullscreen " +
            "src='https://fast.wistia.net/embed/iframe/12345' " +
            "webkitallowfullscreen></iframe>\n")
    end

    it "displays Wistia iframe correctly in episode show view" do
			episode = create(:episode, video_host: "Wistia", video_id: "12345")
        expect(video_iframe(episode)).to \
          eq("<iframe allowfullscreen class='center-block' " +
            "mozallowfullscreen " +
            "msallowfullscreen oallowfullscreen " +
            "src='https://fast.wistia.net/embed/iframe/12345' " +
            "webkitallowfullscreen></iframe>\n")
    end

    it "displays Vimeo iframe correctly in course show view" do
			course = create(:course, video_host: "Vimeo", video_id: "12345")
        expect(video_iframe(course)).to \
          eq("<iframe allowfullscreen class='center-block' " +
            "mozallowfullscreen " +
            "msallowfullscreen oallowfullscreen " +
            "src='https://player.vimeo.com/video/12345' " +
            "webkitallowfullscreen></iframe>\n")
    end

    it "displays Vimeo iframe correctly in episode show view" do
			episode = create(:episode, video_host: "Vimeo", video_id: "12345")
        expect(video_iframe(episode)).to \
          eq("<iframe allowfullscreen class='center-block' " +
            "mozallowfullscreen " +
            "msallowfullscreen oallowfullscreen " +
            "src='https://player.vimeo.com/video/12345' " +
            "webkitallowfullscreen></iframe>\n")
    end
  end
end
