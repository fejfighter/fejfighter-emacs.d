;; Start emacs as a server
(server-start)
;(setq debug-on-error t)

;; set the paths for loading
(add-to-list 'load-path (concat user-emacs-directory "packages"))
(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))
(add-to-list 'load-path (concat user-emacs-directory "fejfighter"))

; install and load the packages
(require 'package-list)

; add the local changes
(require 'fejfighter-custom)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(el-get-user-package-directory "~/emacs.d/packages/configs"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
