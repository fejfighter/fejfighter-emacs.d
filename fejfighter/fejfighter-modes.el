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
(global-set-key (kbd "C-c q") 'popwin:close-popup-window)
(global-set-key (kbd "C-x 6") popwin:keymap)
;(global-set-key (kbd "C-x 6 f") 'popwin:find-file)
;(global-set-key (kbd "C-x 6 b") 'popwin:switch-to-buffer)

;(require 'fejfighter-cedet)
(require 'fejfighter-c-like)

(provide 'fejfighter-modes)
