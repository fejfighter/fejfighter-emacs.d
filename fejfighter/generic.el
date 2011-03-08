
; leave emacs blank when started
(setq inhibit-startup-screen t)

; shorten yes or no
(fset 'yes-or-no-p 'y-or-n-p)

; better lern this in depth
(setq transient-mark-mode t)

; numbers!!
(setq line-number-mode t)
(setq column-number-mode t)
(setq global-linum-mode t)


; init and set theme for emacs
(require 'color-theme)
(color-theme-initialize)
(color-theme-classic) 



