
;; set the paths for loading
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/package")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/fejfighter")


; install and load the packages
(load "packages/package-list")


; add the local changes
(require 'fejfighter/custom)
