;; -*- lexical-binding: t; -*-

(defvar doom--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)


;; ste the cache-dir for this box, use it for storing files we don't have under version control
(require 'xdg)
(defvar cache-dir (concat (xdg-cache-home) "/emacs"))

;; tell straight where to start looking/ pulling to
(setq straight-base-dir cache-dir)
;; don't check for changes on startup, I don't get to modify elisp often
(setq straight-check-for-modifications nil)


(if (and (fboundp 'native-comp-available-p)
         (native-comp-available-p))
    (progn (message "Native compilation is available")
	   (let ((path (concat cache-dir "/eln-dir")))
	     (setq native-compile-target-directory path)
	     (add-to-list 'native-comp-eln-load-path path)))
  (setq straight-disable-native-compile t)
  (message "Native complation is *not* available"))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" cache-dir))
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
(setq use-package-enable-imenu-support t)



;; often build emacs from source and prefix with /usr/local
;; packages with emacs support normally add files to /usr/share/emacs/site-lisp.
;; building locally means it won't get picked up, add it here
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")

(load-file (concat user-emacs-directory "fejfighter-packages.el"))
(load-file (concat user-emacs-directory "fejfighter-init.el"))

