(require 'fejfighter-platform)

;; tell straight where to start looking/ pulling to
(defvar straight-base-dir cache-dir)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" cache-dir))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(require 'straight)

;; don't check for changes on startup, I don't get to modify elisp
;; often and `straight-check-all` isn't too hard
(setq straight-check-for-modifications nil)


(if (and (fboundp 'native-comp-available-p)
         (native-comp-available-p))
    (progn (message "Native compilation is available")
	   (let ((path (concat cache-dir "/eln-dir")))
	     (setq native-compile-target-directory path)
	     (add-to-list 'native-comp-eln-load-path path)))
  (setq straight-disable-native-compile t)
  (message "Native complation is *not* available"))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq use-package-enable-imenu-support t)

