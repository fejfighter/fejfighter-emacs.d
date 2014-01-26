(setq el-get-sources
 (append
  '((:name helm
	   :after (progn
		    (global-set-key (kbd "S-h k") 'helm-show-kill-ring)
		    (global-set-key (kbd "C-c h f") 'helm-find-files)
		    (global-set-key (kbd "C-c h") 'helm-mini)
		    ))
    (:name helm-c-yasnippet)
    (:name helm-helm-commands)
    )
  el-get-sources))


(provide 'helm-package)
  
