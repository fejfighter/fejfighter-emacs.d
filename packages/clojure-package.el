
(setq el-get-sources
 (append
  '((:name clojure-mode
	   :after (progn
		    (add-hook 'clojure-mode-hook 'subword-mode)))
    (:name rainbow-delimiters)
    (:name smartparens)
    (:name cider
	   :after (progn
		    (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
		    (setq nrepl-hide-special-buffers t)
		    (setq nrepl-buffer-name-show-port t)
		    (setq cider-repl-display-in-current-window t)
		    (add-hook 'cider-repl-mode-hook 'subword-mode)
		    (add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
		    (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)))

    (:name elein)
    )
  el-get-sources))


(provide 'clojure-package)
