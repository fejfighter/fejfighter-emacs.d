;

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;compile for speed!
;(load "byte-code-cache")

; add paths to make completion and other external stuff work
(load "fejfighter/path")

;make vendor code work
(load "fejfighter/vendor")

; load packages from vendor (external
; then load relevant config for vendor

(vendor 'auto-complete)
(vendor 'auto-complete-clang)
(vendor 'ac-include)
(load "fejfighter/autocomplete")

(vendor 'cmake-mode)
(vendor 'color-theme)

(vendor 'flymake)
(load "fejfighter/c-mode.el")

(load "fejfighter/ido")

(vendor 'magit)

(vendor 'yasnippet)

; generic/global all conquering config
(load "fejfighter/generic")

(message "Loaded configs correctly, Good Day Sir")
