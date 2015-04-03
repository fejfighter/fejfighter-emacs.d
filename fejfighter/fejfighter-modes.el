;; Python
; scons
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))


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
(global-company-mode t)

(global-set-key (kbd "M-/") 'company-complete-common)

(require 'fejfighter-cedet)

(provide 'fejfighter-modes)
