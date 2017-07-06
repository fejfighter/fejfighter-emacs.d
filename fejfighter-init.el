;; My config of small/non-pacakge stuff

;; Custom File - keep the churn somewhere else
(setq custom-file (concat user-emacs-directory "fejfighter-custom.el"))
(load custom-file)

; leave emacs blank when started
(setq inhibit-startup-screen t)

; shorten yes or no
(fset 'yes-or-no-p 'y-or-n-p)

; numbers!!
(setq line-number-mode t)
(setq column-number-mode t)
(use-package nlinum
  :config (progn
	    (add-hook 'prog-mode-hook 'nlinum-mode))
  :ensure t)


(global-set-key (kbd "<f8>") 'recompile)
(global-set-key (kbd "<shift>-<f8>") 'compile)




;parens
(show-paren-mode t);

; init and set theme for emacs
(load-theme 'wombat) 

; hide the menu bar and tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))     
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq default-directory "~/dev/")



(provide 'fejfighter-init)
