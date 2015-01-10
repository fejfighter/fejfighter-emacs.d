;; Python
					
					; scons
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilities
;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm
(require 'fejfighter-helm)

;; auto completion
(require 'company)
(global-company-mode t)

(require 'fejfighter-cedet)

(provide 'fejfighter-modes)
