(defvar cache-dir (concat user-emacs-directory "cache"))
(defvar state-dir (concat user-emacs-directory "state"))
(defvar data-dir (concat user-emacs-directory "data"))

(defvar child-frames-are-widgets nil "t when childframes are implemented as widgets inside the main toolkit rather thanseparate windows. This is lighter and seemingly more stable than the tradition X11 implementation. Currently this is only the case on --with-pgtk as separate frames were too hard to manage and regularly buggy")

(when (eq window-system 'pgtk)
  (setq child-frames-are-widgets t))

(when (string-equal system-type "darwin")
  (setq cache-dir "~/Library/Caches/emacs"
	data-dir "~/Library/Application Support/emacs"
	state-dir "~/Library/Application Support/emacs")
  ;; used for compiling and calling stuff with eshell
  (setenv "PATH"
          (concat
           "/opt/pkg/bin" ":"
	   "/usr/local/bin" ":"
	   "/bin" ":"
	   "/usr/bin" ":"
           (getenv "PATH")))
  ;; used for loading fly make and the like
  (setq exec-path
	(append exec-path
		'((getenv "PATH")
		  "~/.local/bin"
		  "/opt/pkg/bin"
		  "/usr/local/bin"
		  "/bin/"
		  "/usr/bin/"))))

(when (string-equal system-type "gnu/linux")
  ;; set the cache-dir for this box, use it for storing files we don't have under version control
  (require 'xdg)
  (setq cache-dir (concat (xdg-cache-home) "/emacs")
	data-dir (concat (xdg-data-home) "/emacs")
	state-dir (concat (xdg-state-home) "/emacs"))
  
  ;; used for compiling and calling stuff with eshell
  (setenv "PATH"
          (concat
           "/opt/pkg/bin" ":"
	   "/usr/local/bin" ":"
	   "/bin" ":"
	   "/usr/bin" ":"
           (getenv "PATH")))

  ;; used for loading fly make and the like
  (setq exec-path
	(append exec-path
		'((getenv "PATH")
		  "~/.local/bin"
		  "/opt/pkg/bin"
		  "/usr/local/bin"
		  "/bin/"
		  "/usr/bin/"))))

(provide 'fejfighter-platform)
