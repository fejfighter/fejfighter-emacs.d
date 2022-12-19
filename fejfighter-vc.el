(require 'package)
;(require 'cl-lib)
(require 'fejfighter-platform)

(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-and-compile
  (setq use-package-enable-imenu-support t))
(require 'use-package)

(eval-and-compile
  (setq use-package-always-ensure t))
					;use-package-always-defer t
					;use-package-expand-minimally t))

(require 'cl-lib)
(require 'use-package-core)
; u/slinchisl/ Tony Zorman
(defvar package-vc-use-package-keyword :vc)

(defun package-vc-use-package-set-keyword ()
  (unless (member package-vc-use-package-keyword use-package-keywords)
    (setq use-package-keywords
          (let* ((pos (cl-position :unless use-package-keywords))
                 (head (cl-subseq use-package-keywords 0 (+ 1 pos)))
                 (tail (nthcdr (+ 1 pos) use-package-keywords)))
            (append head (list package-vc-use-package-keyword) tail)))))

(defun use-package-normalize/:vc (name-symbol keyword args)
  (let ((arg (car args)))
    (pcase arg
      ((or `nil `t) (list name-symbol))
      ((pred symbolp) args)
      ((pred listp) (cond
                     ((listp (car arg)) arg)
                     ((string-match "^:" (symbol-name (car arg))) (cons name-symbol arg))
                     ((symbolp (car arg)) args)))
      (_ nil))))

(defun use-package-handler/:vc (name-symbol keyword args rest state)
  (let ((body (use-package-process-keywords name-symbol rest state)))
    ;; This happens at macro expansion time, not when the expanded code is
    ;; compiled or evaluated.
    (if args
        (use-package-concat
         `((unless (package-installed-p ',(pcase (car args)
                                            ((pred symbolp) (car args))
                                            ((pred listp) (car (car args)))))
             (apply #'slot/vc-install ',(cdr args))))
         body)
      body)))

(defun package-vc-use-package-override-:ensure (func name-symbol keyword ensure rest state)
  (let ((ensure (if (plist-member rest :vc)
                    nil
                  ensure)))
    (funcall func name-symbol keyword ensure rest state)))

(defun package-vc-use-package-activate-advice ()
  (advice-add
   'use-package-handler/:ensure
   :around
   #'package-vc-use-package-override-:ensure))

(defun package-vc-use-package-deactivate-advice ()
  (advice-remove
   'use-package-handler/:ensure
   #'package-vc-use-package-override-:ensure))

;; register keyword on require
(package-vc-use-package-set-keyword)


;; (setq package-user-dir (concat state-dir "/elpa"))
;; (setq package-gnupghome-dir (concat state-dir "/elpa"))
;; (setq package-quickstart-file (concat state-dir "/package-quickstart.el"))

(provide 'fejfighter-vc)
