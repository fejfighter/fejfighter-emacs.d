
;; get el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))


(setq
 el-get-sources
 '(el-get
   magit
   yasnippet
   ))



(require 'clojure-package)

(el-get 'sync el-get-sources)

(provide 'package-list)
