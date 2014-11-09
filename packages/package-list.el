;; set up package for el-get to use
;; Based on http://melpa.milkbox.net/#/getting-started .

(require 'package)
(add-to-list 'package-archives
  ;; The 't' means to append, so that MELPA comes after the more
  ;; stable ELPA archive.
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Add ELPA if necessary. Looking at the El-Get package.rcp recipe in
;; ~/local/opt/el-get/recipes it seems this is probably unnecessary.
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)


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
(require 'el-get-elpa)
'(el-get-recipe-path (concat user-emacs-directory "recipes/"))
'(el-get-user-package-directory (concat user-emacs-directory "packages/configs"))



(setq el-get-verbose t)

;; osx needs to add some paths
(require 'path-custom)


(setq
 my:el-get-packages
 '(el-get
   yasnippet
   cedet
   company
   ;; (:name smex				; a better (ido like) M-x
   ;; 	  :after (progn
   ;; 		   (setq smex-save-file "~/.emacs.d/.smex-items")
   ;; 		   (global-set-key (kbd "M-x") 'smex)
   ;; 		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
   ))



(require 'clojure-package)
(require 'haskell-package)
(require 'projectile-package)
;;(require 'python-package)
;;(require 'auto-complete-package)
;(require 'cedet-package)
(require 'clojure-package)
(require 'company-package)
(require 'helm-package)
(require 'version-control-package)


(setq my:el-get-packages
      (append
       '()
       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

(el-get 'sync my:el-get-packages)

(provide 'package-list)


