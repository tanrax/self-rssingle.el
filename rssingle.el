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
(setq-default elfeed-search-filter "@1-week-ago +unread")
(setq elfeed-feeds
      '(
	"http://blog.chromium.org/atom.xml"
	"https://www.reddit.com/r/emacs/.rss"
	"https://programadorwebvalencia.com/feed/index.xml"
	))

;; Update elfeed database
(message "Updating database...")
(require 'elfeed-db)
(elfeed-update)

(sleep-for 1)

;; Wait for elfeed to finish updating
(require 'elfeed-curl)
(while (> elfeed-curl-queue-active 0)
  (sleep-for 1))

;; Generate XML

(message "Generating XML...")

(defun elfeed-db-get-entries ()
  "Get all entries from the elfeed database."
  (let ((entries '()))
    (with-elfeed-db-visit (entry feed)
			  (push entry entries))
    entries))

(defun generate-index-xml ()
  (let* ((xml-file "index.xml")
	 (articles (elfeed-db-get-entries))
	 (xml-header "<?xml version=\"1.0\"?>\n<rss version=\"2.0\">\n<channel>\n")
	 (xml-footer "</channel>\n</rss>\n"))
    (with-temp-file xml-file
      (insert xml-header)
      (dolist (article articles)
	(let ((title (xml-escape-string (elfeed-entry-title article)))
              (date (format-time-string "%F" (elfeed-entry-date article)))
              (link (xml-escape-string (elfeed-entry-link article)))
              (content (xml-escape-string (format "%s" (elfeed-deref (elfeed-entry-content article)))) ))
          (insert (format "  <item>\n    <title>%s</title>\n    <pubDate>%s</pubDate>\n    <link>%s</link>\n    <description>%s</description>\n  </item>\n"
                          title date link content))))
      (insert xml-footer))))
(generate-index-xml)
(message "Done! Check 'index.xml'")
