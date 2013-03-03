
; leave emacs blank when started
(setq inhibit-startup-screen t)

; shorten yes or no
(fset 'yes-or-no-p 'y-or-n-p)

; better lern this in depth
(setq transient-mark-mode t)

; numbers!!
(setq line-number-mode t)
(setq column-number-mode t)
(require 'linum)
(global-linum-mode t)

;parens
(show-paren-mode t);

;remove the curser when its not being used
;(mouse-avoidance-mode t)
;(mouse-avoidance-banish)

; init and set theme for emacs
(load-theme 'tango-dark) 

; hide the menu bar and tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))     

; stippet
;(setq yas/trigger-key "TAB")
;(require 'yasnippet-config)
;(yas/setup "~/.emacs.d/vendor/yasnippet")
