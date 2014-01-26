
;; get el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))


;; now we know el get is installed
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/dev/emacs/el-get/recipes")
(setq el-get-verbose t)

;; osx needs to add some paths
(require 'path-custom)



(setq
 el-get-sources
 '((:name el-get)
   (:name smex				; a better (ido like) M-x
	  :after (progn
		   (setq smex-save-file "~/.emacs.d/.smex-items")
		   (global-set-key (kbd "M-x") 'smex)
		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
   (:name yasnippet)
   ))


(require 'clojure-package)
(require 'haskell-package)
(require 'company-package)
;(require 'cedet-package)
(require 'projectile-package)
;(require 'auto-complete-package)
(require 'version-control-package)


(setq my:el-get-packages
      (append
       '()
       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

(el-get 'sync my:el-get-packages)

(provide 'package-list)
