;; Install Elfeed
(require 'package)

(message "Installing Elfeed...")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'elfeed)
  (package-install 'elfeed))

;; Execute Elfeed
(message "Initializing Elfeed...")
(require 'elfeed)

;; Configure Elfeed
(setq elfeed-db-directory "elfeed-db")
(make-directory elfeed-db-directory t)
(setq elfeed-feeds
      '(
	"https://laylacodes.hashnode.dev/rss.xml"
	"https://lucumr.pocoo.org/feed.atom"
	"https://github.com/clockworkpi/launcher/releases.atom"
	"https://programadorwebvalencia.com/feed/index.xml"
	"https://diarioestoico.com/feed/"
	"https://republicaweb.es/feed/"
	"https://republicaweb.es/feed/podcast"
	"https://static.fsf.org/fsforg/rss/news.xml"
	"https://www.djangoproject.com/rss/weblog/"
	"https://www.microsiervos.com/index.xml"
	"https://hakibenita.com/feeds/all.atom.xml"
	"https://www.blogger.com/feeds/5402814408460261521/posts/default"
	"https://www.oscarlijo.com/blog/feed/"
	"https://stratechery.com/feed/"
	"https://tonsky.me/blog/atom.xml"
	"https://github.blog/feed/"
	"https://twobithistory.org/feed.xml"
	"https://nosinmiscookies.com/feed/"
	"http://planet.es.python.org/rss.xml"
	"https://ondahostil.wordpress.com/feed/"
	"http://neofronteras.com/?feed=rss2"
	"https://www.muylinux.com/feed/"
	"https://mustcomunicacion.es/feed/"
	"https://evilmartians.com/chronicles.atom"
	"http://ep00.epimg.net/rss/elpais/ciencia.xml"
	"https://www.monkeyuser.com/feed.xml"
	"http://www.monstruosfelices.es/legiondelespacio/feed"
	"https://jovicailic.org/feed/"
	"https://javierarcheni.com/feed/"
	"http://feeds.feedburner.com/emezeta"
	"https://erick.navarro.io/blog/index.xml"
	"https://www.exocomics.com/feed"
	"https://www.debian.org/News/news"
	"https://dannyvankooten.com/feed.xml"
	"https://thoughtbot.com/blog/feed"
	"http://feeds.feedburner.com/bufa"
	"https://www.cinestudiodor.es/rss.xml"
	"https://clojure.org/feed.xml"
	"http://feeds.feedburner.com/vidamrr"
	"https://jrsinclair.com/web-development/index.rss"
	"https://blog.frontfest.es/feed.xml"
	"https://www.sublimetext.com/blog/feed"
	"https://whotracks.me/blog/feed.xml"
	"https://medium.com/feed/@unbalancedparen"
	"https://blogs.windows.com/msedgedev/feed/"
	"https://feeds.feedburner.com/ponyfooweekly"
	"https://blog.instapaper.com/rss"
	"http://feeds.feedburner.com/GoogleOpenSourceBlog"
	"https://enmilocalfunciona.io/rss/"
	"https://www.ochobitshacenunbyte.com/feed/"
	"https://thehistoryoftheweb.com/feed/"
	"https://manuel-uberti.github.io/feed.xml"
	"https://www.manueluberti.eu/feed.xml"
	"http://planet.clojure.in/atom.xml"
	"https://tomspencer.dev/blog/index.xml"
	"https://www.fiznool.com/blog/index.xml"
	"https://blog.karenying.com/rss.xml"
	"http://www.freebsd.org/news/rss.xml"
	"https://www.freebsd.org/events/rss.xml"
	"https://www.reddit.com/r/FWClojureJobs/.rss"
	"https://vlctechhub.org/events/upcoming/feed.xml"
	"https://jobs.braveclojure.com/jobs.rss"
	"https://www.clojuriststogether.org/news/index.xml"
	"https://yogthos.net/feed.xml"
	"http://blog.danieljanus.pl/atom.xml"
	"https://github.com/darlinghq/darling/releases.atom"
	"https://isaak.dev/feed.xml"
	"http://ishadeed.com/feed.xml"
	"https://soynomm.com/feed.xml"
	"https://atareao.es/feed"
	"https://www.murilopereira.com/index.xml"
	"https://joshwcomeau.com/rss.xml"
	"https://routley.io/posts/index.xml"
	"https://nullprogram.com/feed/"
	"https://workchronicles.com/feed/"
	"https://www.freecodecamp.org/espanol/news/rss/"
	"https://www.freecodecamp.org/news/rss/"
	"https://www.evercade.co.uk/feed/"
	"https://erick.navarro.io/index.xml"
	"https://blog.elhacker.net/feeds/posts/default"
	"https://lisp-journey.gitlab.io/index.xml"
	"https://slimbook.es/soporte?format=feed&type=rss"
	"https://jrsinclair.com/index.rss"
	"https://batsov.com/atom.xml"
	"https://www.etsy.com/shop/ThroughKaleidoscope/rss"
	"https://www.dedoimedo.com/rss_feed.xml"
	"https://ianbicking.org/feeds/atom.xml"
	"https://calebporzio.com/feed"
	"https://www.welivesecurity.com/la-es/feed"
	"https://feedly.com/i/subscription/feed%2Fhttps%3A%2F%2Ffeed.ctrl.blog%2Flatest.atom"
	"https://simurai.com/rss/"
	"https://www.jamieonkeys.dev/feed.xml"
	"https://linuxhandbook.com/rss/"
	"https://www.danielsieger.com/atom.xml"
	"https://sirupsen.com/atom.xml"
	"https://iffm.me/feeds/all.atom.xml"
	"https://feeds.feedburner.com/WaitingForTheJobsToFinish"
	"https://56k.es/feed"
	"https://medium.com/feed/javascript-scene/tagged/functional-programming"
	"https://themkat.net/feed.xml"
	"https://tblog.mozilla.org/feed"
	"https://sandyuraz.com/feed.xml"
	"https://xenodium.com/rss.xml"
	"https://www.kodingkitty.com/rss.xml"
	"https://homecomputer.com.ar/feed/"
	"https://github.com/spacedriveapp/spacedrive/releases.atom"
	))

;; Update elfeed database
(message "Updating database...")
(require 'elfeed-db)
(elfeed-update)

(sleep-for 1)

(defun elfeed-db-get-entries ()
  "Get all entries from the elfeed database."
  (let ((entries '()))
    (with-elfeed-db-visit (entry feed)
			  (push entry entries))
    entries)
  )

;; Wait for elfeed to finish updating
(require 'elfeed-curl)
(while (> elfeed-curl-queue-active 0)
  (sleep-for 1))

;; Generate XML

(message "Generating XML...")
(defun generate-index-xml ()
  (let* ((xml-file "index.xml")
	 (articles (elfeed-db-get-entries))
	 (xml-header "<rss version=\"2.0\">\n<channel>\n")
	 (xml-footer "</channel>\n"))
    (with-temp-file xml-file
      (insert xml-header)
      (dolist (article articles)
	(let ((title (elfeed-entry-title article))
              (date (format-time-string "%F" (elfeed-entry-date article)))
              (link (elfeed-entry-link article))
              (content (xml-escape-string (format "%s" (elfeed-deref (elfeed-entry-content article)))) ))
          (insert (format "  <item>\n    <title>%s</title>\n    <pubDate>%s</pubDate>\n    <link>%s</link>\n    <content:encoded>%s</content:encoded>\n  </item>\n"
                          title date link content))))
      (insert xml-footer))))
(generate-index-xml)
(message "Done! Check 'index.xml'")
