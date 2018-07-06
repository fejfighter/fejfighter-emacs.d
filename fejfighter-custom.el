(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   (quote
    (company-lsp company-c-headers company-capf company-cmake company-files
		 (company-dabbrev-code company-gtags company-etags company-keywords)
		 company-oddmuse company-dabbrev)))
 '(company-cmake-executable "/opt/pkg/bin/cmake")
 '(package-selected-packages
   (quote
    (yasnippet-snippets lsp-ui lsp-mode hydra quick-peek ivy-xref company-lsp lsp-clangd projectile-cmake all-the-icons all-the-icons-dired all-the-icons-ivy persp-projectile realgud geiser projectile-speedbar counsel-projectile projectile company-c-headers autodisass-llvm-bitcode llvm-mode frames-only-mode imenus flycheck-clangcheck focus ace-window ivy imenu-list popwin yasnippet yasnippet-bundle yatemplate name-frame irony-eldoc json-mode multiple-cursors cmake-mode company-cmake counsel imenu-anywhere flycheck company magit nlinum use-package)))
 '(safe-local-variable-values
   (quote
    ((eval let*
	   ((x
	     (dir-locals-find-file default-directory))
	    (this-directory
	     (if
		 (listp x)
		 (car x)
	       (file-name-directory x))))
	   (unless
	       (or
		(featurep
		 (quote swift-project-settings))
		(and
		 (fboundp
		  (quote tramp-tramp-file-p))
		 (tramp-tramp-file-p this-directory)))
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
	    this-directory))
     (c-default-style . stroustrup)
     (projectile-project-compilation-dir . ".proj")
     (projectile-project-compilation-dir . ".")
     (projectile-project-compilation-dir . "build")
     (eval add-hook
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
