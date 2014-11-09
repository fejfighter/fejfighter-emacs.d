;; select which submodes we want to activate
(mapc (lambda (MODE) (add-to-list 'semantic-default-submodes MODE))
      '(global-semantic-mru-bookmark-mode
	global-semanticdb-minor-mode
	global-semantic-idle-scheduler-mode
	global-semantic-stickyfunc-mode
	;global-cedet-m3-minor-mode
	global-semantic-highlight-func-mode
	global-semanticdb-minor-mode))
(semantic-mode 1)
(require 'semantic/ia)
(global-ede-mode t)
