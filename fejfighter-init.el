;; -*- lexical-binding: t; -*-
;; My config of small/non-pacakge stuff

;; Custom File - keep the churn somewhere else
(setq custom-file (concat user-emacs-directory "fejfighter-custom.el"))
;; this requires emacs 27
(if (not (file-exists-p custom-file)) (make-empty-file custom-file))
(load custom-file)

; leave emacs blank when started
(setq inhibit-startup-screen t)

; shorten yes or no
(fset 'yes-or-no-p 'y-or-n-p)

(setq display-line-number-mode t)
(setq column-number-mode t)
(setq x-gtk-use-system-tooltips t)


(use-package compile
  :bind (("<f8>" . recompile)
	 ("C-<f8>" . compile)))

(use-package imenu
  :bind (("M-i" . imenu)))

(use-package hl-line
  :config
  (set-face-attribute 'hl-line nil :inherit nil :background "gray6")
  :init (global-hl-line-mode t))


(when (string-equal system-type "darwin")
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

(when (string-equal system-type "linux")
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



;parens
(show-paren-mode t);

; Emoji set
(set-fontset-font t 'unicode "Noto Color Emoji" nil 'prepend)

; hide the menu bar and tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq default-directory "~/dev/")



(provide 'fejfighter-init)
