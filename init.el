(load-file "~/.emacs.d/cedet/cedet-devel-load.el")
;(add-to-list 'load-path "~/.emacs.d/vendor/mmm")
;(load "~/.emacs.d/vendor/mmm/mmm-auto.el")

;
(server-start)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

; add paths to make completion and other external stuff work
(load "fejfighter/path")

;make vendor code work
(load "fejfighter/vendor")

; load packages from vendor (external
; then load relevant config for vendor

;(load "fejfighter/auctex")

;slime
;(add-to-list 'load-path "~/.emacs.d/vendor/slime")  ; your SLIME directory
;(setq inferior-lisp-program "/opt/local/bin/clisp -K full") ; your Lisp system
;(require 'slime)
;(slime-setup '(slime-fancy))


(vendor 'popup)
(vendor 'fuzzy)
(vendor 'auto-complete)
;(vendor 'auto-complete-clang)
(vendor 'ac-slime)

(load "fejfighter/autocomplete")
(load "fejfighter/java-mode")
(load "fejfighter/cedet")

(vendor 'ecb)
;(vendor 'jdee)
(vendor 'android-mode)


(vendor 'flymake)
(load "fejfighter/c-mode")

;(vendor 'haskell-mode)

(vendor 'hideshowvis)
(vendor 'hideshow-org)
(load "fejfighter/folding")

(load "fejfighter/ido")

(vendor 'lua-mode)
(load "fejfighter/lua-mode")

(vendor 'magit)

;(vendor 'mmm)


;(vendor 'slime)

(vendor 'todo)

;(require 'flymake-ruby)
;(add-hook 'ruby-mode-hook 'flymake-ruby-load)


(vendor 'yasnippet)

(load "fejfighter/yasnippet-config")

; generic/global all conquering config
(load "fejfighter/generic")
(load "fejfighter/keys")

(message "Loaded configs correctly, Good Day Sir")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cedet-android-current-version "4.1.2")
 '(cedet-android-sdk-root "/opt/homebrew/Cellar/android-sdk/r20.0.3")
 '(cedet-java-classpath-extension (quote ("/opt/homebrew/Cellar/android-sdk/r20.0.3/platforms/android-4.1.2/android.jar")))
 '(ede-project-directories (quote ("/Users/fejfighter/dev/gameoflife" "/Users/fejfighter/dev/gameoflife/src/org/fejfighter")))
 '(global-cedet-m3-minor-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
