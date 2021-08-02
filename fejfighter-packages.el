;; -*- lexical-binding: t; -*-
(use-package doom-themes
  :config
  (load-theme 'doom-gruvbox t))

(use-package magit
  :bind (("C-x C-g" . magit-status)))

(use-package company
  :hook (prog-mode . company-mode))

(use-package company-posframe
  :hook (company-mode . company-posframe-mode)
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :bind (:map flymake-mode-map
	      ("M-p" . flymake-goto-prev-error)
	      ("M-n" . flymake-goto-next-error)))

(use-package flymake-posframe
  :straight (flymake-posframe :type git :host github
                              :repo "Ladicle/flymake-posframe")
  :after flymake
  :hook (flymake-mode . flymake-posframe-mode))


(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode))

(use-package yasnippet
  :commands yas-minor-mode
  :hook
  (prog-mode . yas-minor-mode))

(straight-use-package 'cmake-mode)
(straight-use-package '(tramp :type git :url git://git.savannah.gnu.org/tramp.git ))

(use-package swiper
  :bind (("M-s" . swiper)) )

(use-package counsel
  :diminish (ivy-mode . "")
  :init
  (counsel-mode t)
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
  :diminish (ivy-mode . "")
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t))
  :bind  (("C-c C-r" . ivy-resume)
	  ("<f6>" . ivy-resume)))

(use-package ivy-posframe
  :diminish (ivy-posframe . "")
  :init (ivy-posframe-mode))

(use-package imenu-anywhere)

(use-package which-key-posframe
  :straight (which-key-posframe :type git :host github
				:repo "fejfighter/which-key-posframe")
  :init
  (use-package which-key)
  :config
  (which-key-mode t)
  (which-key-posframe-mode t)
  (setq which-key-posframe-poshandler 'posframe-poshandler-window-bottom-left-corner))

(use-package multiple-cursors
  :defer
  :init
  (multiple-cursors-mode t))

(provide 'fejfighter-packages)
