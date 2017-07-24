;;; package -- Summary


;;; Commentary:
;;; Code:

;(add-to-list 'load-path (concat user-emacs-directory "vendor/lsp-mode/"))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode 1)
  :config
  (add-hook 'ede-compdb-project-rescan-hook #'flycheck-compdb-setup)
  (add-hook 'ede-minor-mode-hook #'flycheck-compdb-setup)
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

(use-package lsp-mode
  :load-path "vendor/lsp-mode/"
  :config
  (add-hook 'c-mode-hook 'lsp-mode )
  (add-hook 'c++-mode-hook 'lsp-mode))

(use-package lsp-clangd
  :load-path "vendor/lsp-clangd/")

(use-package projectile
  :ensure t
  :config
  (use-package counsel-projectile :ensure t)
  (projectile-mode t)
  (setq projectile-completion-system 'ivy)
  (counsel-projectile-on))

(use-package persp-projectile
  :ensure t
  :config
  (persp-mode t))

(use-package projectile-cmake
  :load-path "vendor/projectile-cmake/"
  :config
  (message (projectile-cmake-compdb-path)))
