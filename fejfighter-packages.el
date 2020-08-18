;; -*- lexical-binding: t; -*-
(use-package magit
  :ensure t
  :bind (("C-x C-g" . magit-status)))

(use-package company
  :ensure t
  :hook (prog-mode . company-mode))

(use-package company-posframe
  :ensure t
  :hook (company-mode . company-posframe-mode)
    :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

(use-package flycheck-posframe
  :ensure t
  :after flycheck
  :hook (flycheck-mode-hook . flycheck-posframe-mode))


(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode))

(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook
  (prog-mode . yas-minor-mode))

(use-package delight
  :ensure t)

(use-package ace-window
  :ensure t
  :bind
  (("M-p" . ace-window)))

(use-package focus
  :commands focus-mode
  :ensure t)

(use-package cmake-mode
  :ensure t)

(use-package swiper
  :ensure t
  :bind (("M-s" . swiper)) )

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

(use-package ivy-posframe
  :ensure t
  :init (ivy-posframe-mode)
  )

(use-package imenu-anywhere
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :init
  (multiple-cursors-mode t))

(provide 'fejfighter-packages)
