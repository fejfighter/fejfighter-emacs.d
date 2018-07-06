;;; package -- Summary


;;; Commentary:
;;; Code:

;(add-to-list 'load-path (concat user-emacs-directory "vendor/lsp-mode/"))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode 1)
  :config
  ;(add-hook 'ede-compdb-project-rescan-hook #'flycheck-compdb-setup)
  ;(add-hook 'ede-minor-mode-hook #'flycheck-compdb-setup)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'ede-minor-mode-hook (lambda ()
				   (setq company-c-headers-path-system
					 'ede-object-system-include-path)
				   (setq company-c-headers-path-user
					 'ede-object-system-include-path))))
(use-package company-lsp
  :ensure yasnippet
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-async t)
  (setq company-lsp-enable-snippet t)
  (setq company-lsp-enable-recompletion t))
  
(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (setq lsp-ui-sideline-show-symbol nil)
  )


(use-package lsp-clangd
  :ensure t
  :load-path "vendor/lsp-clangd/"
  :config
  (add-hook 'c-mode-hook #'lsp-c-enable )
  (add-hook 'c++-mode-hook #'lsp-c++-enable))


(use-package projectile
  :ensure t
  :config
  (use-package counsel-projectile :ensure t)
  (projectile-mode t)
  (setq projectile-completion-system 'ivy)
  (counsel-projectile-mode t))

(use-package persp-projectile
  :ensure t
  :config
  (use-package perspective :ensure t)
  (persp-mode t))

(use-package realgud-lldb
  :load-path "vendor/realgud-lldb/"
  :config
  (use-package realgud :ensure t))

