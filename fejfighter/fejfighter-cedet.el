
;; cedet
(semantic-mode 1)
(require 'ede-compdb)
(require 'semantic/ia)

(global-semantic-decoration-mode 1)
(global-semantic-highlight-edits-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semanticdb-minor-mode 1)

(semantic-add-system-include "/usr/include/boost" 'c++-mode)
(semantic-add-system-include "/usr/include/GL" 'c++-mode)


(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-cedet-hook)


(require 'ede)
(global-ede-mode 1)


(provide 'fejfighter-cedet)
