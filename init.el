;; Start emacs as a server
(server-start)
;(setq debug-on-error t)

(add-to-list 'load-path (concat user-emacs-directory "fejfighter"))
(add-to-list 'load-path (concat user-emacs-directory "vendor"))

;; cedet-git needs to be loaded before anything else
;(load-file (concat user-emacs-directory "vendor/cedet-git/cedet-devel-load.el"))
;(load-file (concat user-emacs-directory "vendor/ede-meson/ede-meson.el"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; TODO make this an auto detecting method
;(if (eq system-type 'darwin)
;    (setq path-to-cask-el '"/usr/local/Cellar/cask/0.7.2/cask.el")
;(setq path-to-cask-el '"~/.cask/cask.el")
  
  
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

; install and load the packages
;(require 'package-list)


; add the local changes
(require 'fejfighter-init)
 
