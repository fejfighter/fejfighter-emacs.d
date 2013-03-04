; no tabs, but indent with 4 spaces
;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(setq c-default-style "Stroustrup"
      c-basic-offset 4)

(setq objc-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))
(setq c++-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))

(add-hook 'c++-mode-hook
  '(lambda ( )
   (c-set-style "Stroustrup")
   (c-toggle-auto-state)))

; auto syntax check
;(require 'flymake-clang-c)
;(add-hook 'c-mode-hook 'flymake-clang-c-load)
;(require 'flymake-clang-c++)
;(add-hook 'c++-mode-hook 'flymake-clang-c++-load)

; cmake building
(defun maybe-cmake-project-hook ()
  (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))
