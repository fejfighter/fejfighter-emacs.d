

;;; Code:


(require 'yasnippet) ;; not yasnippet-bundle


;;; Setup
(defun yas/setup (package-directory)
  ;; Ensure to end with /
  (setq package-directory (file-name-as-directory package-directory))
  (add-to-list 'load-path package-directory)
  (yas/global-mode 1)
  (yas/load-directory (concat package-directory "snippets")))


;;; Disable flymake during expansion
(defvar flymake-is-active-flag nil)

(defadvice yas/expand-snippet
  (before inhibit-flymake-syntax-checking-while-expanding-snippet activate)
  (setq flymake-is-active-flag
        (or flymake-is-active-flag
            (assoc-default 'flymake-mode (buffer-local-variables))))
  (when flymake-is-active-flag
    (flymake-mode-off)))

(add-hook 'yas/after-exit-snippet-hook
          '(lambda ()
             (when flymake-is-active-flag
               (flymake-mode-on)
               (setq flymake-is-active-flag nil))))

;;; `yas/buffer-local-condition' workaround
(setq yas/buffer-local-condition
      '(or (not (memq (get-text-property (point) 'face)
                      '(font-lock-comment-face font-lock-doc-face font-lock-string-face)))
           '(require-snippet-condition . force-in-comment)))

(provide 'yasnippet-config)

;; How to save (DO NOT REMOVE!!)
;; (emacswiki-post "yasnippet-config.el")
;;; yasnippet-config.el ends here
