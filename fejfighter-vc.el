;; -*- lexical-binding: t; -*-
(require 'package)
(require 'fejfighter-platform)

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

(provide 'fejfighter-vc)
