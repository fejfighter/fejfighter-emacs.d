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

;; simple loader macro to reduce repeated code
(defmacro fej-req (file &optional noerror)
  `(let* ((reqname (concat "fejfighter-" ,file))
	  (req (intern reqname))
	  (filename (expand-file-name (concat reqname ".el") user-emacs-directory)))
    (require req filename ,noerror)))

(fej-req "platform")
(fej-req "vc")

(fej-req "init")
(fej-req "packages")
(fej-req "work" 'noerror)

(defun my-cleanup-gc ()
  "Clean up gc."
  (setq gc-cons-threshold  67108864) ; 64M
  (setq gc-cons-percentage 0.1) ; original value
  (garbage-collect))

(run-with-idle-timer 4 nil #'my-cleanup-gc)

(message "*** Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time (time-subtract after-init-time before-init-time)))
           gcs-done)
