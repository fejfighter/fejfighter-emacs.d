;this is my emacs dir
;there are many like it
;but this one is mine
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")



; load CEDET first, it cracks the shits if you don't
(load-file (concat emacs-dir "vendor/cedet/cedet-devel-load.el"))
;(setq debug-on-error t)

(require 'package)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;load package list separate
(load-file (concat emacs-dir "package-list.el"))


;; load vendor and custom files
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ede-project-directories (quote ("/home/fejfighter/devel/track/src"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
