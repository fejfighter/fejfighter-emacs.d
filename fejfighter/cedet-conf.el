;;; emacs-rc-cedet.el ---

;;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
;;(add-to-list 'semantic-default-submodes ')

;; Activate semantic
(semantic-mode 1)

(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
;(require 'semantic/bovine/clang)
(require 'semantic/ia)
(require 'semantic/decorate/include)
(require 'semantic/lex-spp)
(require 'semantic/java)
;(require 'semantic/db-javap)
;(require 'eassist)

;(semanticdb-enable-gnu-global-databases 'c-mode t)
;(semanticdb-enable-gnu-global-databases 'c++-mode t)

;(when (cedet-ectag-version-check t)
;  (semantic-load-enable-primary-ectags-support))

;; SRecode
;(global-srecode-minor-mode 1)

;; EDE
;(global-ede-mode 1)
;(ede-enable-generic-projects)

;; setup compile package
(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

;; android
;(cedet-android-sdk-root /opt/homebrew/Cellar/android-sdk/r20.0.3)

;;; emacs-rc-cedet.el ends here

