
(setq
 el-get-sources
 (append 
  '((:name magit                                ; git meet emacs, and a binding
	   :after (progn
		    (global-set-key (kbd "C-x C-g") 'magit-status))))
  el-get-sources))

(provide 'version-control-package)
