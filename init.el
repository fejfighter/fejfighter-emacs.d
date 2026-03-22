;; -*- lexical-binding: t; -*-

;; unset file handling to stop running
;; extra regex on startup, In general this is only used for tramp
;; related handling which has no value during startup
(defvar doom--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
;; But remember to reset the value at the end of startup
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq file-name-handler-alist doom--file-name-handler-alist)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(eval-when-compile
  (require 'use-package))
(eval-and-compile
  (setq use-package-enable-imenu-support t
        use-package-always-ensure t
	use-package-always-defer t
	use-package-expand-minimally t
	use-package-verbose t))

(require 'my-platform)
(package-initialize)
(use-package no-littering
  :ensure t
  :demand t
  :init
  (setq no-littering-etc-directory (expand-file-name "config/" data-dir)
	no-littering-var-directory (expand-file-name "data/" state-dir))
  :config
  ;; Custom File - keep the churn somewhere else
  (setq custom-file (no-littering-expand-etc-file-name "custom.el")))

(unless package-archive-contents
  (package-refresh-contents))

(require 'my-init)
(require 'my-packages)
(require 'work nil 'noerror)
;(require 'my-mail nil 'noerror)
(require 'my-gnus)

(unless 'mps
  (defun my-cleanup-gc ()
    "Clean up gc."
    (setq gc-cons-threshold  67108864) ; 64M
    (setq gc-cons-percentage 0.1) ; original value
    (garbage-collect))
  (run-with-idle-timer 4 nil #'my-cleanup-gc))

(defun startup-message ()
  (message "*** Emacs loaded in %s with %d garbage collections."
           (emacs-init-time)
           gcs-done))
(add-hook 'emacs-startup-hook #'startup-message)
