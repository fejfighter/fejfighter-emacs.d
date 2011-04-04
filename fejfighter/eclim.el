 (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/emacs-eclim/"))
 ;; only add the vendor path when you want to use the libraries provided with emacs-eclim
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/emacs-eclim/vendor"))
(require 'eclim)

(setq eclim-auto-save t)
;(global-eclim-mode)