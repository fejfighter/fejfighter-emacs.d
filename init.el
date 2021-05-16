;; -*- lexical-binding: t; -*-

(defvar doom--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; don't check for  changes on startup, I don't get to modify elisp often
(setq straight-check-for-modifications nil)

(if (not (native-comp-available-p))
    (setq straight-disable-native-compile t))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)


;; often build emacs from source and prefix with /usr/local
;; packages with emacs support normally add files to /usr/share/emacs/site-lisp.
;; building locally means it won't get picked up, add it here
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")

; set the garbage collector early
(setq garbage-collection-messages t)
(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

;; Set garbage collection threshold to 1GB.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold 16777216 ; 16MB
		  gc-cons-percentage 0.4
		  file-name-handler-alist doom--file-name-handler-alist)))

(defun doom-defer-garbage-collection-h ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun doom-restore-garbage-collection-h ()
  ;; Defer it so that commands launched immediately after will enjoy the
  ;; benefits.
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold 16777216))))

(add-hook 'minibuffer-setup-hook #'doom-defer-garbage-collection-h)
(add-hook 'minibuffer-exit-hook #'doom-restore-garbage-collection-h)




;; When idle for 15sec run the GC no matter what.
(defvar k-gc-timer
  (run-with-idle-timer 15 t
                       (lambda ()
                         (message "Garbage Collector has run for %.06fsec"
                                  (k-time (garbage-collect))))))
(when (featurep 'gtk4)
  (setq xft-ignore-color-fonts nil))



(load-file (concat user-emacs-directory "fejfighter-packages.el"))
(load-file (concat user-emacs-directory "fejfighter-lsp.el"))
(load-file (concat user-emacs-directory "fejfighter-init.el"))


