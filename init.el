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
(load "fejfighter/color-theme-twilight")

(vendor 'flymake)
(load "fejfighter/c-mode.el")

(load "fejfighter/ido")
(load "fejfighter/keys")

(vendor 'magit)

(vendor 'todo)

(vendor 'yasnippet)
(load "fejfighter/yas-conf")

; generic/global all conquering config
(load "fejfighter/generic")

(message "Loaded configs correctly, Good Day Sir")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#141314" :foreground "#ff9B4E")))))
