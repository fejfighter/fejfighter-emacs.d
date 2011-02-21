;

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;compile for speed!
;(load "byte-code-cache")

(load "fejfighter/vendor")
(load "fejfighter/ido")



(vendor 'cmake-mode)
(vendor 'auto-complete-clang)
;(vendor 'clang-completion-mode)

