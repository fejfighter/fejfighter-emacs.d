
(provide 'ac-include)
(require 'auto-complete)

(defvar global-candidates-cache nil)

(defun global-candidates-init ()
  ( setq global-candidates-cache (concat "<" (directory-files "/usr/include/") ">")))


(defvar ac-source-include
'((init . global-candidates-init) 
  (candidates . global-candidates-cache)
  (prefix . "#include \\(.*\\)")))


(setq ac-sources '(ac-source-include))

