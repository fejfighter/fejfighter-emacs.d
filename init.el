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

;; simple loader function to reduce repeated code
(defun fej-load (file)
  (let* ((filename (concat "fejfighter-" file ".el"))
	 (full-path (expand-file-name filename user-emacs-directory)))
    (load-file full-path)))

(fej-load "platform")
(fej-load "straight")
(fej-load "packages")
(fej-load "init")
