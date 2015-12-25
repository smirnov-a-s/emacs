(setq my:el-get-packages
      '(el-get
	ample-regexps
	anaconda-mode
	cedet
	cl-lib
	color-theme
	company-irony
	company-mode
	ctable
	dash
	deferred
	el-get
	epc
	epl
	f
	flx
	function-args
	fuzzy
	google-c-style
	helm-gtags
	helm-project
	helm
	highlight-symbol
	idle-highlight-mode
	iedit
	irony-mode
	json-rpc
	multiple-cursors
	pkg-info
	popup
	projectile
	python-environment
	pythonic
	s
	smex
	swiper
	undo-tree
	yasnippet
	color-theme-inkpot
	)
      )

(setq my:el-get-packages
      (append my:el-get-packages
	      (loop for src in el-get-sources collect (el-get-source-name src))))
(el-get 'sync my:el-get-packages)

(provide 'packages-kit)
