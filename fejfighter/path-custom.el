;
(when (string-equal system-type "darwin")
  ;; used for compiling and calling stuff with eshell
  (setenv "PATH"
          (concat
           "/opt/local/bin/" ":"
           "/bin/" ":"
           "/usr/bin/" ":"
           "/usr/local/bin" ":"
           "/usr/local/git/bin" ":"
           (getenv "PATH")
           )
          )

  ;; used for loading fly make and the like
  
  (setq exec-path
	(append exec-path
        '(;(getenv "PATH")
          "/opt/local/bin/"
          "/usr/local/bin/"
          "/usr/local/git/bin/"
          "/bin/"
          "/usr/bin/"
          "/usr/texbin/"
          "/opt/homebrew/bin/"
          ))
        ))

(provide 'path-custom)