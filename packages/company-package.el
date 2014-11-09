
(setq el-get-sources
(append
 '((:name company
	   :type elpa
	   :after (progn ()
		    ))
	    
    (:name company-c-headers
    	  :type elpa
;    	  :after (progn ()
;    		   (add-to-list 'company-backends 'company-c-headers))
	  )
    )
 el-get-sources))


(provide 'company-package)
