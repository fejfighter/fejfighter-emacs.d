;; -*- lexical-binding: t; -*-

;; unset file handling to stop running extra regex on startup, In
;; general this is only used for tramp related handling which has no
;; value during startup
(defvar doom--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
;; But remember to reset the value at the end of startup
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq file-name-handler-alist doom--file-name-handler-alist)))

(require 'fejfighter-platform)
(require 'fejfighter-straight)
(require 'fejfighter-packages)
(load-file (concat user-emacs-directory "fejfighter-platform.el"))
(load-file (concat user-emacs-directory "fejfighter-straight.el"))
(load-file (concat user-emacs-directory "fejfighter-packages.el"))

(load-file (concat user-emacs-directory "fejfighter-init.el"))
