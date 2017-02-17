(use-package magit
  :ensure t
  :bind (("C-x C-g" . magit-status)))

(use-package company
  :ensure t
  :config (add-hook 'prog-mode-hook 'company-mode))



;; (use-package flycheck-clangcheck
;;   :ensure t
;;   :config
;;   (setq flycheck-clangcheck-build-path (ede-directory-get-toplevel-open-project)
  
;;   )

(use-package frames-only-mode
  :ensure t
  )


(use-package ace-window
  :ensure t
  :bind
  (("M-p" . ace-window)))

(use-package focus
  :ensure t)

(use-package aggressive-indent)
(use-package company-cmake)
(use-package cmake-mode)

(use-package swiper
  :ensure t
  :init
  (global-set-key "\C-s" 'swiper))

(use-package counsel
  :ensure t
  :init
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  :bind
  (
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-load-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("C-c g" . counsel-git)
  ("C-c j" . counsel-git-grep)
  ("C-c k" . counsel-ag)
  ("C-x l" . counsel-locate)
  ("M-i" . counsel-imenu)
  ("M-/" . counsel-company)))

(use-package ivy
  :ensure t
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t))
  :bind  (("C-c C-r" . ivy-resume)
	  ("<f6>" . ivy-resume)))

(use-package imenu-anywhere)

(use-package multiple-cursors
  :ensure t
  :init
  (multiple-cursors-mode t))

(provide 'fejfighter-packages)


