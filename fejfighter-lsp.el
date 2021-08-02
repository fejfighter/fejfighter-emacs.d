;; -*- lexical-binding: t; -*-
;;; package -- Summary


;;; Commentary:
;;; Code:


(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-hook 'ede-minor-mode-hook (lambda ()
				   (setq company-c-headers-path-system
					 'ede-object-system-include-path)
				   (setq company-c-headers-path-user
					 'ede-object-system-include-path))))
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((c-mode c++-mode go-mode) . lsp-deferred)
  :config
  (setq lsp-clients-clangd-args '("-j=3" "--background-index" "--compile-commands-dir=.")))

(use-package lsp-ui
  :commands lsp-ui-mode
  :hook lsp
  :bind (:map lsp-ui-mode-map
	      ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
	      ([remap xref-find-references] . lsp-ui-peek-find-references)
	      ([remap imenu] . lsp-ui-imenu))
  :config
  (setq ;lsp-ui-sideline-enable nil
   lsp-ui-doc-enable nil
   lsp-ui-imenu-enable t
   ;lsp-ui-flycheck-enable t
   lsp-ui-sideline-ignore-duplicate t))

(use-package rustic)

(use-package project
  :after lsp
  :bind (:map project-prefix-map
	      ("m" . magit-status)
	      ("l" . vc-print-log)
	      ("a" . lsp-clangd-find-other-file))
  :config
  (setq project-switch-commands
   '((project-find-file "Find file" nil)
     (project-find-regexp "Find regexp" nil)
     (project-dired "Dired" nil)
     (project-vc-dir "VC-Dir" nil)
     (project-eshell "Eshell" nil)
     (magit-status "magit" nil))))

(use-package treemacs
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if (executable-find "python3") 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-icons-dired
  :after treemacs dired
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit)

(use-package lsp-treemacs
  :after treemacs lsp)
