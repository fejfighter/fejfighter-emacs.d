;

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;compile for speed!
;(load "byte-code-cache")

(load "fejfighter/vendor")
(load "fejfighter/ido")



(vendor 'cmake-mode)

(vendor 'auto-complete)
(vendor 'auto-complete-clang)
(load "fejfighter/autocomplete")

(vendor 'color-theme)
(vendor 'magit)
(vendor 'yasnippet)


;(vendor 'clang-completion-mode)

(message "Loaded configs correctly, Good Day Sir")
