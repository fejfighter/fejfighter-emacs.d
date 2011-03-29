
;
(when (string-equal system-type "darwin")
  ;; used for compiling and calling stuff with eshell
  (setenv "PATH"
	  (concat
	   "/opt/local/bin/" ":"
	   "/bin/" ":"
	   "/usr/bin/" ":"
	   (getenv "PATH")
	   )
	  )

  ;; used for loading fly make and the like
  
  (setq exec-path
	'(;(getenv "PATH")
	  "/opt/local/bin/"
	  "/usr/local/bin/"
	  "/bin/"
	  "usr/bin/"
	  )
	))