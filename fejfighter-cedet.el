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
    (which-function-mode t))

(defun flycheck-compdb-setup ()
  (when (and ede-object (oref ede-object compilation))
    (let* ((comp (oref ede-object compilation))
           (cmd (get-command-line comp)))

      ;; Configure flycheck clang checker.
      ;; TODO: configure gcc checker also
      (when (string-match " -std=\\([^ ]+\\)" cmd)
        (setq-local flycheck-clang-language-standard (match-string 1 cmd)))
      (when (string-match " -stdlib=\\([^ ]+\\)" cmd)
        (setq-local flycheck-clang-standard-library (match-string 1 cmd)))
      (when (string-match " -fms-extensions " cmd)
        (setq-local flycheck-clang-ms-extensions t))
      (when (string-match " -fno-exceptions " cmd)
        (setq-local flycheck-clang-no-exceptions t))
      (when (string-match " -fno-rtti " cmd)
        (setq-local flycheck-clang-no-rtti t))
      (when (string-match " -fblocks " cmd)
        (setq-local flycheck-clang-blocks t))
      (setq-local flycheck-clang-includes (get-includes comp))
      (setq-local flycheck-clang-definitions (get-defines comp))
      (setq-local flycheck-clang-include-path (get-system-include-path comp t))
      )))


;;; fejfighter-cedet.el ends here
