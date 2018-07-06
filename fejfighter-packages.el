(use-package magit
  :ensure t
  :bind (("C-x C-g" . magit-status)))

(use-package company
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'company-mode))

(use-package flymake
  :config
  (add-hook 'prog-mode-hook 'flymake-mode))

(use-package display-line-numbers
  :config
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t))

(use-package delight
  :ensure t)

;; (use-package frames-only-mode
;;   :ensure t)

(use-package ace-window
  :ensure t
  :bind
  (("M-p" . ace-window)))

(use-package focus
  :ensure t)

(use-package aggressive-indent
  :ensure t)
(use-package company-cmake
  :ensure t)
(use-package cmake-mode
  :ensure t)

(use-package swiper
  :ensure t
  :init
  (global-set-key "\M-s" 'swiper))

(use-package counsel
  :ensure t
  :diminish (ivy-mode . "")
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
  ("M-/" . counsel-company))
  :config
  (setq ivy-use-virtual-buffers t)       ; extend searching to bookmarks and
  (setq ivy-height 20)                   ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ")     ; count format, from the ivy help page
  (setq ivy-display-style 'fancy)
  (setq ivy-format-function 'ivy-format-function-line) ; Make highlight extend all the way to the right)
  )

(use-package ivy
  :ensure t
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t))
  :bind  (("C-c C-r" . ivy-resume)
	  ("<f6>" . ivy-resume)))

(use-package imenu-anywhere
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :init
  (multiple-cursors-mode t))

(provide 'fejfighter-packages)
