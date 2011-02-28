;

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;compile for speed!
;(load "byte-code-cache")

;make vendor code work
(load "fejfighter/vendor")


(load "fejfighter/ido")


(vendor 'auto-complete)
(vendor 'auto-complete-clang)
(load "fejfighter/autocomplete")

(vendor 'flymake)
(load "fejfighter/c-mode.el")

(vendor 'cmake-mode)


(vendor 'color-theme)
(vendor 'magit)
(vendor 'yasnippet)


;(vendor 'clang-completion-mode)

(message "Loaded configs correctly, Good Day Sir")
