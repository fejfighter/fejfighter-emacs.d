
(provide 'auto-complete-include)

(defvar ac-include-candidates-cache nil)

(defun ac-inculde-candidates-init ()
  ( setq global-candidates-cache (concat "<" (directory-files "/usr/include/") ">")))

(defun ac-include-document ()
  )


;(defun ac-include-prefix ()
 ; (prefix . "#include \\(.*\\)")))

;(defvar ac-source-include
;'( 
;  (candidates . global-candidates-cache)
;  

(ac-define-source include
  '((init . global-candidates-init)
    (candidates . global-candidates-cache)
    (prefix . "#include \\(.*\\)")
    (requires . 0)
    (document . ac-include-document)
;    ( action . ac-include-action)
    (cache)
    (symbol . "i")))

(setq ac-sources '(ac-source-include))