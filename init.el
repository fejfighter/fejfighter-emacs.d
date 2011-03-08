;

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;compile for speed!
;(load "byte-code-cache")

; add paths to make completion and other external stuff work
(load "fejfighter/path")

;make vendor code work
(load "fejfighter/vendor")


(load "fejfighter/ido")

(vendor 'auto-complete)
(vendor 'auto-complete-clang)
(load "fejfighter/autocomplete")

(vendor 'cmake-mode)
(vendor 'color-theme)

(vendor 'flymake)
(load "fejfighter/c-mode.el")

(vendor 'magit)

(vendor 'yasnippet)

(message "Loaded configs correctly, Good Day Sir")
