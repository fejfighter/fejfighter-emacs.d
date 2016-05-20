(require 'helm)
(require 'helm-config)
(require 'helm-swoop)

;;; Code

(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c k") 'helm-show-kill-ring)
(global-set-key (kbd "M-s") 'helm-swoop)
(global-set-key (kbd "C-c s") 'helm-multi-swoop)
(global-set-key (kbd "C-c f") 'helm-flycheck)

(helm-autoresize-mode t)
(setq helm-full-frame nil)
 
(provide 'fejfighter-helm)

