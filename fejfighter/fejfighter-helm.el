(require 'helm)
(require 'helm-swoop)

(helm-mode 1)

(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c k") 'helm-show-kill-ring)
(global-set-key (kbd "C-s") 'helm-swoop)
(global-set-key (kbd "C-c s") 'helm-multi-swoop)


(provide 'fejfighter-helm)

