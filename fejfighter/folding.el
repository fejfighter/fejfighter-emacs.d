;folding
;; hideshow for programming
(load-library "hideshow")
(require 'hideshow-org)

(add-hook 'cc-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)


(dolist (hook (list 'emacs-lisp-mode-hook
		    'c++-mode-hook))
  (add-hook hook 'hideshowvis-enable))

