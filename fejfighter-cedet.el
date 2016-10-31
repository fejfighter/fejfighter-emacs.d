;;; package -- Summary


;;; Commentary:
;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "vendor/cedet/"))
(load-file (concat user-emacs-directory "vendor/cedet/cedet-devel-load.el"))

(use-package cedet-devel-load
  :init
  ;; Add further minor-modes to be enabled by semantic-mode.  See
  ;; doc-string of `semantic-default-submodes' for other things you can
  ;; use here.
    (dolist (submode '(global-semantic-idle-summary-mode
		       global-semantic-mru-bookmark-mode
		       global-semantic-idle-local-symbol-highlight-mode
		       global-semantic-stickyfunc-mode
		       global-semantic-decoration-mode
		       global-semantic-idle-breadcrumbs-mode
		       global-semantic-show-parser-state-mode
		       global-semantic-show-unmatched-syntax-mode))
      (add-to-list 'semantic-default-submodes submode t))
    
    ;; Enable Semantic
    (semantic-mode t)
    (global-ede-mode t)

    (semantic-load-enable-all-exuberent-ctags-support)
    (semantic-load-enable-excessive-code-helpers)
    (which-function-mode t)
    )
;;; fejfighter-cedet.el ends here
