;;; package -- Summary


;;; Commentary:
;;; Code:

;(add-to-list 'load-path (concat user-emacs-directory "vendor/lsp-mode/"))

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'ede-minor-mode-hook (lambda ()
				   (setq company-c-headers-path-system
					 'ede-object-system-include-path)
				   (setq company-c-headers-path-user
					 'ede-object-system-include-path))))
(use-package eglot
  :ensure t
  )

(use-package projectile
  :ensure t
  :config
  (use-package counsel-projectile :ensure t)
  (projectile-mode t)
  (setq projectile-completion-system 'ivy)
  (counsel-projectile-mode t)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

