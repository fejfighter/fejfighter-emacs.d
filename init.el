(load-file "~/.emacs.d/vendor/cedet/cedet-devel-load.el")
;(add-to-list 'load-path "~/.emacs.d/vendor/mmm")
;(load "~/.emacs.d/vendor/mmm/mmm-auto.el")

;

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")


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
(load "fejfighter/cedet")
(load "fejfighter/java-mode")
(vendor 'ecb)
;(vendor 'jdee)

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



(vendor 'yasnippet)

(load "fejfighter/yasnippet-config")

; generic/global all conquering config
(load "fejfighter/generic")
(load "fejfighter/keys")

(message "Loaded configs correctly, Good Day Sir")

