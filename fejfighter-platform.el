
(defvar cache-dir (concat user-emacs-directory "cache"))
(defvar data-dir (concat user-emacs-directory "data"))

(when (string-equal system-type "darwin")
  (setq cache-dir "~/Library/Caches/emacs")
  (setq data-dir "~/Library/Application Support/emacs")
  ;; used for compiling and calling stuff with eshell
  (setenv "PATH"
          (concat
           "/opt/pkg/bin" ":"
	   "/usr/local/bin" ":"
	   "/bin" ":"
	   "/usr/bin" ":"
           (getenv "PATH")
           )
          )
  
  ;; used for loading fly make and the like
  (setq exec-path
	(append exec-path
		'((getenv "PATH")
		  "~/.local/bin"
          "/opt/pkg/bin"
	  "/usr/local/bin"
          "/bin/"
          "/usr/bin/"
          ))
        ))

(when (string-equal system-type "gnu/linux")
  ;; set the cache-dir for this box, use it for storing files we don't have under version control
  (require 'xdg)
  (setq cache-dir (concat (xdg-cache-home) "/emacs"))
  (setq data-dir (concat (xdg-data-home) "/emacs"))
  
  ;; used for compiling and calling stuff with eshell
  (setenv "PATH"
          (concat
           "/opt/pkg/bin" ":"
	   "/usr/local/bin" ":"
	   "/bin" ":"
	   "/usr/bin" ":"
           (getenv "PATH")
           )
          )

  ;; used for loading fly make and the like
  (setq exec-path
	(append exec-path
		'((getenv "PATH")
		  "~/.local/bin"
          "/opt/pkg/bin"
	  "/usr/local/bin"
          "/bin/"
          "/usr/bin/"
          ))
        ))

(provide 'fejfighter-platform)
