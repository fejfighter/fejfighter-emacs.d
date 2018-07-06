(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(add-to-list 'load-path (concat user-emacs-directory "vendor/"))

(load-file (concat user-emacs-directory "fejfighter-lsp.el"))
(load-file (concat user-emacs-directory "fejfighter-packages.el"))
(load-file (concat user-emacs-directory "fejfighter-init.el"))

