(defvar my-packages '(flymake 
		      auctex 
		      yasnippet
		      auto-complete 
		      magit 
		      paredit 
		      python
		      fuzzy 
		      smex
		      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
