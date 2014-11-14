;; Start emacs as a server
(server-start)
;(setq debug-on-error t)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

; install and load the packages
;(require 'package-list)

(add-to-list 'load-path (concat user-emacs-directory "fejfighter"))
;(add-to-list 'load-path (concat user-emacs-directory "vendor"))

; add the local changes
(require 'fejfighter-init)
 
