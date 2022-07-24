;; -*- lexical-binding: t; -*-
;; My config of built-in or other small stuff
(require 'fejfighter-platform)

;; Custom File - keep the churn somewhere else
(setq custom-file (concat cache-dir "/fejfighter-custom.el"))
;; this requires emacs 27
(if (not (file-exists-p custom-file)) (make-empty-file custom-file))
(load custom-file)

(use-package svg-lib
  :straight (:type built-in)
  :config
  (setq svg-lib-icons-dir (expand-file-name "svg-lib/" cache-dir)))

(use-package display-line-numbers
  :straight (:type built-in)
  :hook (prog-mode . display-line-numbers-mode))

(use-package compile
  :straight (:type built-in)
  :bind (("<f8>" . recompile)
	 ("C-<f8>" . compile)))

(use-package imenu
  :straight (:type built-in)
  :bind (("M-i" . imenu)))

(use-package hl-line
  :straight (:type built-in)
  :config
  (set-face-attribute 'hl-line nil :inherit nil :background "gray6")
  :init (global-hl-line-mode t))

(use-package flymake
  :straight (:type built-in)
  :hook ((prog-mode . flymake-mode))
  :bind (:map flymake-mode-map
	      ("M-p" . flymake-goto-prev-error)
	      ("M-n" . flymake-goto-next-error)))

(use-package eshell
  :straight (:type built-in)
  :config
  (setq eshell-directory-name (concat cache-dir "/eshell")))

(use-package tramp
  :defer 1
  :straight (:type built-in)
  :config
  (setq tramp-persistency-file-name (concat cache-dir "/tramp")))

(use-package bookmark
  :straight (:type built-in)
  :config
  (setq bookmark-default-file (concat cache-dir "/bookmarks")))

(use-package desktop
  :straight (:type built-in)
  :config
  (desktop-save-mode t)
  (setq desktop-restore-eager 10))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :straight (:type built-in)
  :init
  (savehist-mode t)
  :config
  (setq savehist-file (concat cache-dir "/history")))

(use-package project
  ;;:after magit
  :straight (:type built-in)
  :bind (:map project-prefix-map
	      ("m" . magit-status)
	      ("M" . magit-fetch-all)
	      ("l" . vc-print-log))
  :custom
  (project-list-file (concat cache-dir "/projects"))
  :config
  (setq project-switch-commands
   '((project-find-file "Find file" nil)
     (project-find-regexp "Find regexp" nil)
     (project-dired "Dired" nil)
     (project-vc-dir "VC-Dir" nil)
     (project-eshell "Eshell" nil)
     (magit-status "magit" 109))))

(use-package cc-mode
  :straight (:type built-in)
  :after eglot
  :hook (((c-mode c++-mode) . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) . ("clangd"
						      "-j=4"
						      "--background-index"))))

(use-package emacs
  :init
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)

  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t)

  ;;parens
  (show-paren-mode t);

  (setq indent-tabs-mode nil)

  ;; leave emacs blank when started
  (setq inhibit-startup-screen t)

  ; shorten yes or no
  (setq use-short-answers t)

  (setq column-number-mode t)
  (setq x-gtk-use-system-tooltips t)

  (setq auto-save-list-file-prefix (concat cache-dir "/auto-save-list/.saves-"))


  ;; Emoji set
  (set-fontset-font t 'unicode "Noto Color Emoji" nil 'prepend)

  ;; hide the menu bar and tool bar
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)))

(setq default-directory "~/dev/")

;; often build emacs from source and prefix with /usr/local
;; packages with emacs support normally add files to /usr/share/emacs/site-lisp.
;; building locally means it won't get picked up, add it here
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")


(provide 'fejfighter-init)
