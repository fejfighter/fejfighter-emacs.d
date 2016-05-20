;; Python
; scons
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))

(require 'meson)
(setq auto-mode-alist
      (cons '("meson.build" . meson-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilities
;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cider
(require 'cider)

;; helm
(require 'fejfighter-helm)

(require 'flycheck)
(global-flycheck-mode t)

;; auto completion
(require 'company)
					;(require 'helm-company)
(global-company-mode t)
(global-set-key (kbd "M-/") 'company-complete-common)
(global-set-key (kbd "C-M-/") 'helm-company)

;; popwin
(require 'popwin)
(require 'import-popwin)
(popwin-mode t)
(global-set-key (kbd "C-c i") 'import-popwin)

;(require 'fejfighter-cedet)
(require 'fejfighter-c-like)

(provide 'fejfighter-modes)
