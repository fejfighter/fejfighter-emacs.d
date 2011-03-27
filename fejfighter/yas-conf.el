(require 'yas-jit)

;(yas/initialize)
;(yas/load-directory "~/.emacs.d//snippets")

(setq snippet-directory "~/.emacs.d/snippets")

(setq yas/root-directory snippet-directory)
(yas/jit-load)