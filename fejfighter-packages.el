;; -*- lexical-binding: t; -*-
(require 'fejfighter-platform)

(use-package esup
  :defer 2)

(use-package doom-themes
  :config
  (load-theme 'doom-gruvbox t))

;; (use-package gcmh
;;   :defer 1
;;   :config
;;   (setq garbage-collection-messages t)
;;   (gcmh-mode t))

(use-package transient
  :defer 2
  :config
  (setq transient-history-file (concat cache-dir "/transient.el")))

(defun auto-display-magit-process-buffer (&optional args)
  "Automatically display the process buffer when it is updated."
  (let ((magit-display-buffer-noselect t))
    (magit-process-buffer)))

(advice-add 'magit-process-set-mode-line-error-status :before
	      #'auto-display-magit-process-buffer)
(use-package magit
  :defer 2
  :bind (("C-x C-g" . magit-status)))

(use-package git-link)

(use-package transient-posframe
  :defer 2
  :if window-system
  :init
  (transient-posframe-mode t))

(use-package corfu
  :defer 1
  :if window-system
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
  (global-corfu-mode))

(use-package corfu-terminal
  :unless window-system
  :straight (corfu-terminal
	     :type git
	     :repo "https://codeberg.org/akib/emacs-corfu-terminal.git")
  :config
  (use-package popon
    :straight (popon
	       :type git
	       :repo "https://codeberg.org/akib/emacs-popon.git")))

(use-package kind-icon
  :defer 1
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  (kind-icon-use-icons nil)
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

(use-package eglot-tempel
  :after eglot
  :straight (eglot-tempel :type git
			   :host github
			   :repo "fejfighter/eglot-tempel")
  :defer 2)

;; Configure Tempel
(use-package tempel
  ;; Require trigger prefix before template name when completing.
  ;; :custom
  ;; (tempel-trigger-prefix "<")

  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))

  :init

  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; `tempel-expand' only triggers on exact matches. Alternatively use
    ;; `tempel-complete' if you want to see all matches, but then you
    ;; should also configure `tempel-trigger-prefix', such that Tempel
    ;; does not trigger too often when you don't expect it. NOTE: We add
    ;; `tempel-expand' *before* the main programming mode Capf, such
    ;; that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
)


(use-package toolbox-tramp
  :straight (toolbox-tramp :type git
			   :host github
			   :repo "fejfighter/toolbox-tramp")
  :defer 1)

(use-package rust-mode
  :after eglot
  :hook (rust-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer" "-v" "-v"))))

(use-package yasnippet
  :diminish  yas-minor-mode
  :hook
  (prog-mode . yas-minor-mode))

(use-package cmake-mode
  :defer 1
  :after eglot
  :config
  (add-to-list 'eglot-server-programs '(cmake-mode . ("cmake-language-server"))))

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

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config
  ;; Optionally replace `completing-read-multiple' with an enhanced version.
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

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
   consult--source-recent-file consult--source-project-recent-file consult--source-bookmark
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
            (car (project-root project)))))
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
   ("C-M-;" . embark-dwim)        ;; good alternative: M-.
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
  :if window-system
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
        completion-category-overrides '((file (styles basic partial-completion)))))

;; (defun just-one-face (fn &rest args)
;;   (let ((orderless-match-faces [completions-common-part]))
;;     (apply fn args)))

;; (advice-add 'company-capf--candidates :around #'just-one-face)


(use-package consult-eglot
  :defer 1
  :after eglot consult
  :bind (:map eglot-mode-map
	      ([remap xref-find-apropos] . consult-eglot-symbols)
	      ("M-g s" . eglot-code-symbols)
	      ("M-g a" . eglot-code-actions)))

(use-package hyperbole
  :defer 2)

(use-package which-key
  :defer 2
  :diminish
  :config
  (which-key-mode t))

(use-package which-key-posframe  :diminish
  :after which-key
  :config
  (which-key-posframe-mode t))

(use-package iedit)

(use-package eldoc-box
  :defer 3
  :after eldoc
  :config
  (eldoc-box-hover-at-point-mode t)
  )


(provide 'fejfighter-packages)
