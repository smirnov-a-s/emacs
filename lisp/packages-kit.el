(setq my:el-get-packages
      '(el-get
	auto-complete-c-headers
	auto-complete
	cedet
	cl-lib
	clang-complete-async
	ctable
	dash
	deferred
	el-get
	epc
	epl
	function-args
	fuzzy
	google-c-style
	helm-gtags
	helm-projectile
	helm
	iedit
	jedi
	pkg-info
	popup
	projectile
	python-environment
	swiper
	yasnippet
	eassist
	)
      )

(setq my:el-get-packages
      (append my:el-get-packages
	      (loop for src in el-get-sources collect (el-get-source-name src))))
(el-get 'sync my:el-get-packages)

(provide 'packages-kit)
