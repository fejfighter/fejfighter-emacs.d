(require 'package)
(require 'fejfighter-platform)

(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(eval-and-compile
  (setq use-package-enable-imenu-support t))
(require 'use-package)

(eval-and-compile
  (setq use-package-always-ensure t
	use-package-always-defer t
	use-package-expand-minimally t))

;; (setq package-user-dir (concat state-dir "/elpa"))
;; (setq package-gnupghome-dir (concat state-dir "/elpa"))
;; (setq package-quickstart-file (concat state-dir "/package-quickstart.el"))

(provide 'fejfighter-vc)
