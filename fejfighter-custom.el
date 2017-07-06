(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lsp-clangd projectile-cmake lsp-mode all-the-icons all-the-icons-dired all-the-icons-ivy persp-projectile realgud geiser projectile-speedbar counsel-projectile projectile company-c-headers autodisass-llvm-bitcode llvm-mode frames-only-mode imenus flycheck-clangcheck focus aggressive-indent ace-window ivy imenu-list popwin yasnippet yasnippet-bundle yatemplate name-frame irony-eldoc json-mode multiple-cursors cmake-mode company-cmake counsel imenu-anywhere flycheck company magit nlinum use-package)))
 '(safe-local-variable-values
   (quote
    ((eval add-hook
	   (quote prog-mode-hook)
	   (lambda nil
	     (whitespace-mode 1))
	   (not :APPEND)
	   :BUFFER-LOCAL)
     (whitespace-style face lines indentation:space)
     (eval let*
	   ((x
	     (dir-locals-find-file default-directory))
	    (this-directory
	     (if
		 (listp x)
		 (car x)
	       (file-name-directory x))))
	   (unless
	       (featurep
		(quote swift-project-settings))
	     (add-to-list
	      (quote load-path)
	      (concat this-directory "utils")
	      :append)
	     (let
		 ((swift-project-directory this-directory))
	       (require
		(quote swift-project-settings))))
	   (set
	    (make-local-variable
	     (quote swift-project-directory))
	    this-directory))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
