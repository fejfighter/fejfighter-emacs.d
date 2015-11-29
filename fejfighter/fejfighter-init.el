;; Custom File
(setq custom-file (concat user-emacs-directory "fejfighter/fejfighter-custom.el"))
(load custom-file)

;(defvar compile-command "scons")

;;; SCons builds into a 'build' subdir, but we want to find the errors
;;; in the regular source dir.  So we remove build/XXX/YYY/{dbg,final}/ from the
;;; filenames.
;(defun process-error-filename (filename)
;  (let ((case-fold-search t))
;    (setq f (replace-regexp-in-string
;             "[Ss]?[Bb]uild[\\/].*\\(final\\|dbg\\)[^\\/]*[\\/]" "" filename))
;    (cond ((file-exists-p f)
;           f)
;          (t filename))))

;(setq compilation-parse-errors-filename-function 'process-error-filename)

; leave emacs blank when started
(setq inhibit-startup-screen t)

; shorten yes or no
(fset 'yes-or-no-p 'y-or-n-p)

; better learn this in depth
(setq transient-mark-mode t)

; numbers!!
(setq line-number-mode t)
(setq column-number-mode t)
(require 'linum)
(add-hook 'prog-mode-hook 'linum-mode)


;parens
(show-paren-mode t);

;remove the curser when its not being used
;(mouse-avoidance-mode t)
;(mouse-avoidance-banish)

; init and set theme for emacs
(load-theme 'tango-dark) 

; hide the menu bar and tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))     
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq default-directory "~/dev/")

;(set 'pop-up-frames 'graphic-only)


(provide 'fejfighter-custom)

(require 'path-custom)

(require 'fejfighter-modes)
(require 'fejfighter-vcs)

(provide 'fejfighter-init)
