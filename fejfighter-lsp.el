;;; package -- Summary


;;; Commentary:
;;; Code:


(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'ede-minor-mode-hook (lambda ()
				   (setq company-c-headers-path-system
					 'ede-object-system-include-path)
				   (setq company-c-headers-path-user
					 'ede-object-system-include-path))))
(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (add-hook 'c-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (define-key lsp-ui-mode-map [remap imenu] #'lsp-ui-imenu)
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil
        lsp-ui-imenu-enable t
	lsp-ui-sideline-ignore-duplicate t))

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package projectile
  :ensure t
  :config
  (use-package counsel-projectile :ensure t)
  (projectile-mode t)
  (setq projectile-completion-system 'ivy)
  (counsel-projectile-mode t)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

