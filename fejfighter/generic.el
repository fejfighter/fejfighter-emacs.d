
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

; init and set theme for emacs
(require 'color-theme)
(color-theme-initialize)
(color-theme-twilight)
 
; Open emacs maximized                                                                                                
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32       
			 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32                
			 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)     
