(setq el-get-sources
 (append
  '((:name helm
	   :after (progn
		    (global-set-key (kbd "S-h k") 'helm-show-kill-ring)
		    (global-set-key (kbd "S-h f") 'helm-find-files)
		    (global-set-key (kbd "S-h") 'helm-mini)
		    (global-set-key (kbd "M-x") 'helm-M-x)
		    ))
    (:name helm-c-yasnippet)
    (:name helm-helm-commands)
    (:name helm-swoop)
    )
  el-get-sources))


(provide 'helm-package)
  
