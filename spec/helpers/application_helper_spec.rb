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
    context " YouTube" do
      it "renders iframe correctly in course show view" do
        course = create(:course, video_host: "YouTube", video_id: "12345")
          expect(video_iframe(course)).to \
            eq("<iframe allowfullscreen class='center-block' " +
              "mozallowfullscreen " +
              "msallowfullscreen oallowfullscreen " +
              "src='https://www.youtube.com/embed/12345' " +
              "webkitallowfullscreen></iframe>\n")
      end

      it "renders iframe correctly in episode show view" do
        episode = create(:episode, video_host: "YouTube", video_id: "12345")
          expect(video_iframe(episode)).to \
            eq("<iframe allowfullscreen class='center-block' " +
              "mozallowfullscreen " +
              "msallowfullscreen oallowfullscreen " +
              "src='https://www.youtube.com/embed/12345' " +
              "webkitallowfullscreen></iframe>\n")
      end
    end

    context "Wistia" do
      it "renders iframe correctly in course show view" do
        course = create(:course, video_host: "Wistia", video_id: "12345")
          expect(video_iframe(course)).to \
            eq("<iframe allowfullscreen class='center-block' " +
              "mozallowfullscreen " +
              "msallowfullscreen oallowfullscreen " +
              "src='https://fast.wistia.net/embed/iframe/12345' " +
              "webkitallowfullscreen></iframe>\n")
      end

      it "renders iframe correctly in episode show view" do
        episode = create(:episode, video_host: "Wistia", video_id: "12345")
          expect(video_iframe(episode)).to \
            eq("<iframe allowfullscreen class='center-block' " +
              "mozallowfullscreen " +
              "msallowfullscreen oallowfullscreen " +
              "src='https://fast.wistia.net/embed/iframe/12345' " +
              "webkitallowfullscreen></iframe>\n")
      end
    end

    context "Vimeo" do
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

  context "social buttons" do
    context "Twitter" do
      it "renders script correctly" do
        expect(twitter_script).to \
          eq("<script>" +
            "!function(d,s,id){" +
            "var js,fjs=d.getElementsByTagName(s)[0]," +
            "p=/^http:/.test(d.location)?'http':'https';" +
            "if(!d.getElementById(id)){" +
            "js=d.createElement(s);" +
            "js.id=id;" +
            "js.src=p+'://platform.twitter.com/widgets.js';" +
            "fjs.parentNode.insertBefore(js,fjs);}}" +
            "(document, 'script', 'twitter-wjs');</script>\n")
			end

      it "renders tweet video button correctly" do
        title = "this is a test title"
        expect(tweet_video_button(title)).to \
          eq("<a href='https://twitter.com/share' "+
            "class='twitter-share-button' " +
            "data-url='https://programer.tv' " +
            "data-text='أنا أشاهد \"this is a test title\"' " +
            "data-via='ProgramerTV' data-lang='ar'></a>\n")
      end

      it "renders tweet article button correctly" do
        title = "this is a test title"
        expect(tweet_article_button(title)).to \
          eq("<a href='https://twitter.com/share' "+
            "class='twitter-share-button' " +
            "data-url='https://programer.tv' " +
            "data-text='أنا أقرأ \"this is a test title\"' " +
            "data-via='ProgramerTV' data-lang='ar'></a>\n")
      end
    end

    context "Facebook" do
      it "renders script correctly" do
        expect(facebook_script).to \
          eq("<div id='fb-root'></div>" +
						"<script>(function(d, s, id) {" +
						"var js, fjs = d.getElementsByTagName(s)[0];" +
						"if (d.getElementById(id)) return;" +
						"js = d.createElement(s); js.id = id;" +
						"js.src = 'https://connect.facebook.net/ar_AR/sdk.js#xfbml=1" +
						"&version=v2.5';" +
						"fjs.parentNode.insertBefore(js, fjs);" +
						"}(document, 'script', 'facebook-jssdk'));</script>\n")
      end

      it "renders button correctly" do
        page_path = "https://programer.tv"
        expect(facebook_button(page_path)).to \
          eq("<div class='fb-like' data-href='https://programer.tv' " +
            "data-layout='button' data-action='like' " +
            "data-show-faces='false' data-share='false'></div>\n")
      end
    end
  end

  context "user avatar" do
    it "renders facebook avatar" do
      user = create(:user, provider: "facebook",
                    image_link: "https://example.com")
      expect(get_user_avatar(user, "200x200")).to \
        eq('<img src="https://example.com" alt="Example" width="200" ' +
          'height="200" />')
    end

    it "renders twitter avatar" do
      user = create(:user, provider: "twitter",
                    image_link: "https://example.com")
      expect(get_user_avatar(user, "50x50")).to \
        eq('<img src="https://example.com" alt="Example" width="50" ' +
           'height="50" />')
    end

    it "renders gravatar avatar" do
      user = create(:user, email: "user@example.com")
      expect(get_user_avatar(user, "25x25")).to \
        eq('<img src="https://gravatar.com/avatar/' +
           'b58996c504c5638798eb6b511e6f49af?d=mm" ' +
           'alt="B58996c504c5638798eb6b511e6f49af?d=mm" width="25" ' +
           'height="25" />')
    end
  end

  context "google analytics" do
    it "renders script correctly" do
      expect(google_analytics_script).to \
        eq("<script>" +
          "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){" +
          "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o)," +
          "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)" +
          "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');" +
          "ga('create', 'UA-73229321-1', 'auto');" +
          "ga('send', 'pageview');" +
          "</script>\n")
    end
  end

  context "google verification meta tag" do
    it "render meta tag correctly" do
      expect(google_verification_meta_tag).to \
        eq("<meta name='google-site-verification' content='JR0_bcUI50cjMpWRB-630NrAfQ8rQGb9SPnnJns6kSI' />\n")
    end
  end

  context "page title" do
    it "assigns default page title properly" do
      expect(page_title). to eq("programer.tv")
    end

    it "assign page title properly" do
      expect(page_title("test title")). to eq("programer.tv - test title")
    end
  end
end
