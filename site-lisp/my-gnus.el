;; This buffer is for text that is not saved, and for Lisp evaluation.  -*- lexical-binding: t; -*-
;; To create a file, visit it with ‘C-x C-f’ and enter text in its buffer.


;; (setq gnus-select-method '(nnnil ""))
;; (setq gnus-secondary-select-methods  '((nnmaildir "fejfighter"
;; 						  (directory "/home/fejfighter/.mail/fejfighter/")
						  
;; 						  (gnus-search-engine gnus-search-notmuch
;; 								      (config-file "/home/fejfighter/.notmuch-config"))))


;; http://groups.google.com/group/gnu.emacs.gnus/browse_thread/thread/a673a74356e7141f
(when window-system
  (setq gnus-sum-thread-tree-indent "  ")
  (setq gnus-sum-thread-tree-root "") ;; "● ")
  (setq gnus-sum-thread-tree-false-root "") ;; "◯ ")
  (setq gnus-sum-thread-tree-single-indent "") ;; "◎ ")
  (setq gnus-sum-thread-tree-vertical        "│")
  (setq gnus-sum-thread-tree-leaf-with-other "├─► ")
  (setq gnus-sum-thread-tree-single-leaf     "╰─► "))
(setq gnus-summary-line-format
      (concat
       "%0{%U%R%z%}"
       "%3{│%}" "%1{%d%}" "%3{│%}" ;; date
       "  "
       "%4{%-20,20f%}"               ;; name
       "  "
       "%3{│%}"
       " "
       "%1{%B%}"
       "%s\n"))
(setq gnus-summary-display-arrow t)

;; (with-current-buffer gnus-group-buffer
;;     (gnus-topic-mode 0)
;;     (setq gnus-topic-alist nil gnus-topic topology nil)
;;     ;; Now push to those two variables.  You can also use
;;     ;; `gnus-topic-move-matching' to move nnmaildir groups into, e.g.,
;;     ;; "misc".
;;     (gnus-topic-mode 1)
;;     (gnus-group-list-groups))

(use-package gnus
  :defer t
  :custom
  (gnus-search-default-engines '(notmuch))
  (gnus-select-method '(nnnil "non"))
  (gnus-secondary-select-methods '((nnmaildir "fejfighter"
					      (directory "~/.mail/fejfighter")
					      (get-new-mail nil)
					      (gnus-search-engine gnus-search-notmuch
								  (remove-prefix "/home/fejfighter/.mail/fejfighter/")
								  (config-file "/home/fejfighter/.notmuch-config")))
				   (nnmaildir "jeffwalsh08"
					      (directory "~/.mail/jeffwalsh08")
					      (get-new-mail nil)
					      (gnus-search-engine gnus-search-notmuch
								  (remove-prefix "/home/fejfighter/.mail/jeffwalsh08/")
								  (config-file "/home/fejfighter/.notmuch-config")))
				   (nnmaildir "patreon"
					      (directory "~/.mail/patreon")
					      (get-new-mail nil)
					      (gnus-search-engine gnus-search-notmuch
								  (remove-prefix "/home/fejfighter/.mail/patreon/")
								  (config-file "/home/fejfighter/.notmuch-config")))
				   (nntp "gmane"
                                         (nntp-address "news.gmane.io"))
				   (nntp "kernel-lore"
					 (nntp-address "nntp.lore.kernel.org"))
				   ))
  (gnus-large-newsgroup 1000)
  (gnus-large-ephemeral-newsgroup 1000)
  (gnus-show-threads t)
  (gnus-asynchronous t)
  (gnus-use-cache t)
  (gnus-thread-indent-level 1)
  (gnus-thread-hide-subtree t)
  (gnus-search-use-parsed-queries t)
  (gnus-verbose 10)
  (gnus-verbose-backends 10)
  (gnus-always-read-dribble-file t)
  (fill-column 72)
  (mail-user-agent 'message-user-agent)
  (message-auto-save-directory "~/mail/draft")
  (message-default-mail-headers "Cc: \nBcc: \n")
  (message-directory "~/mail/")
  (message-kill-buffer-on-exit t)
  ;; (message-send-mail-function 'message-smtpmail-send-it)
  ;; (send-mail-function 'smtpmail-send-it)
  ;; (smtpmail-smtp-server "smtp.fastmail.com")
  ;; (smtpmail-smtp-service 587)
  (user-mail-address "fejfighter@gmail.com")
  (user-full-name "Jeff Walsh")
  :config
  (gnus-add-configuration '(article (horizontal 1.0 (summary .5 point) (article 1.0)))))

(provide 'my-gnus)
