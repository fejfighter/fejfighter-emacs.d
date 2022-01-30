;; -*- lexical-binding: t; -*-
(use-package doom-themes
  :config
  (load-theme 'doom-gruvbox t))

(use-package transient
  :config
  (setq transient-history-file (concat cache-dir "/transient.el")))

(use-package magit
  :bind (("C-x C-g" . magit-status)))

(use-package transient-posframe
  :init
  (transient-posframe-mode t))

(use-package corfu
  ;; Optional customizations
  :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-commit-predicate nil)   ;; Do not commit selected candidates on next input
  ;(corfu-quit-at-boundary t)     ;; Automatically quit at word boundary
  (corfu-quit-no-match t)        ;; Automatically quit if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; You may want to enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since dabbrev can be used globally (M-/).
  :init
  (corfu-global-mode))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  (kind-icon-use-icon nil)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package corfu-doc
  :straight (corfu-doc :type git
		       :host github
		       :repo "galeo/corfu-doc")
  :hook ((corfu-mode . corfu-doc-mode))
  :bind (:map corfu-map
	      ("M-p" . corfu-doc-scroll-down)
	      ("M-n" . corfu-doc-scroll-up)))

;; Use dabbrev with Corfu!
(use-package dabbrev
  :straight (:type built-in)
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand)))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

(use-package flymake
  :straight (:type built-in)
  :hook ((prog-mode . flymake-mode))
  :bind (:map flymake-mode-map
	      ("M-p" . flymake-goto-prev-error)
	      ("M-n" . flymake-goto-next-error)))

(use-package eglot
  :straight (eglot :type git
		   :host github
		   :repo "joaotavora/eglot")
  :hook ((prog-mode . eglot-ensure)))

(use-package docker-tramp
  :config
  (setq docker-tramp-docker-executable "podman"))

(use-package toolbox-tramp
  :straight (toolbox-tramp :type git
			   :host github
			   :repo "fejfighter/toolbox-tramp"))

(use-package rust-mode)

(use-package project
  :straight (:type built-in)
  :bind (:map project-prefix-map
	      ("m" . magit-status)
	      ("M" . magit-fetch-all)
	      ("l" . vc-print-log))
  :config
  (setq project-switch-commands
   '((project-find-file "Find file" nil)
     (project-find-regexp "Find regexp" nil)
     (project-dired "Dired" nil)
     (project-vc-dir "VC-Dir" nil)
     (project-eshell "Eshell" nil)
     (magit-status "magit" 109))
  project-list-file (concat cache-dir "/projects")))


(use-package display-line-numbers
  :straight (:type built-in)
  :hook (prog-mode . display-line-numbers-mode))

(use-package yasnippet
  :diminish  yas-minor-mode
  :hook
  (prog-mode . yas-minor-mode))

(straight-use-package 'cmake-mode)

(use-package tramp
  :straight (:type built-in)
  :config
  (setq tramp-persistency-file-name (concat cache-dir "/tramp")))

(use-package bookmark
  :straight (:type built-in)
  :config
  (setq bookmark-default-file (concat cache-dir "/bookmarks")))



;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c b" . consult-bookmark)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
	 ([remap imenu] . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s f" . consult-find)
         ("M-s F" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch)
         :map isearch-mode-map
         ("M-e" . consult-isearch)                 ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch)               ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi))           ;; needed by consult-line to detect isearch

  ;; Enable automatic preview at point in the *Completions* buffer.
  ;; This is relevant when you use the default completion UI,
  ;; and not necessary for Vertico, Selectrum, etc.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Optionally replace `completing-read-multiple' with an enhanced version.
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-file consult--source-project-file consult--source-bookmark
   :preview-key (kbd "M-."))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; Optionally configure a function which returns the project root directory.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (project-roots)
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project)))))
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-root-function #'projectile-project-root)
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-root-function #'vc-root-dir)
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-root-function (lambda () (locate-dominating-file "." ".git")))
)

(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

(use-package vertico-posframe
  :straight
  '(vertico-posframe
    :type git
    :host github
    :repo "tumashu/vertico-posframe")
  :init
  (vertico-posframe-mode t)
  :config
  (setq vertico-posframe-parameters
	'((left-fringe . 8)
	  (right-fringe . 8))
	vertico-posframe-poshandler #'posframe-poshandler-frame-bottom-left-corner))

;; Use the `orderless' completion style. Additionally enable
;; `partial-completion' for file path expansion. `partial-completion' is
;; important for wildcard support. Multiple files can be opened at once
;; with `find-file' if you enter a wildcard. You may also give the
;; `initials' completion style a try.
(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(defun just-one-face (fn &rest args)
  (let ((orderless-match-faces [completions-common-part]))
    (apply fn args)))

(advice-add 'company-capf--candidates :around #'just-one-face)

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :straight (:type built-in)
  :init
  (savehist-mode t)
  :config
  (setq savehist-file (concat cache-dir "/history")))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(use-package consult-eglot
  :after eglot consult
  :bind (:map eglot-mode-map
	      ([remap xref-find-apropos] . consult-eglot-symbols)
	      ("M-g a" . eglot-code-actions)))

(use-package imenu-anywhere)

(use-package which-key
  :diminish
  :config
  (which-key-mode t))

(use-package iedit)

(use-package desktop
  :straight (:type built-in)
  :config
  (desktop-save-mode t)
  (setq desktop-restore-eager 10))

(use-package gcmh
  :config
  (setq garbage-collection-messages t)
  (gcmh-mode t))


(provide 'fejfighter-packages)
