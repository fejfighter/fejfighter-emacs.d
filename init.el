; load CEDET first, it cracks the shits if you don't
;(load-file "~/.emacs.d/cedet/cedet-devel-load.el")
;(setq debug-on-error t)

(require 'package)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(flymake flymake-shell auctex yasnippet
		      auto-complete magit paredit python)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load vendor and custom files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")
(defvar vendor-dir (concat emacs-dir "vendor/")
  "Packages not yet avilable in ELPA")
(defvar config-dir (concat emacs-dir "fejfighter/")
  "The core of my emacs config")


;; Add to load path
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path config-dir)

;; Require packages in modules/
(mapc 'load (directory-files config-dir nil "^[^#].*el$"))
(server-start)

