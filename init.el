;(setq debug-on-error t)

;; set the paths for loading
(add-to-list 'load-path (concat user-emacs-directory "packages"))
(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))
(add-to-list 'load-path (concat user-emacs-directory "fejfighter"))

; install and load the packages
(require 'package-list)

; add the local changes
(require 'fejfighter-custom)
