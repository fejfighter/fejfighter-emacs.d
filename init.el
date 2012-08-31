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

(vendor 'popup)
(vendor 'fuzzy)
(vendor 'auto-complete)
;(vendor 'auto-complete-clang)

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

;(vendor 'qmake-mode)

(vendor 'yasnippet)
;(vendor 'yas-jit)
(load "fejfighter/yasnippet-config")

; generic/global all conquering config
(load "fejfighter/generic")
(load "fejfighter/keys")

(message "Loaded configs correctly, Good Day Sir")
;(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(safe-local-variable-values (quote ((clang-completion-flags "-I/usr/include/QtCore\",\"-I/usr/include/QtSql\"\"-I/usr/include")))))
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(linum ((t (:background "#141314" :foreground "#ff9B4E")))))
