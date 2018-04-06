(setq my:el-get-packages
      '(el-get
	auto-complete-c-headers
	auto-complete
	google-c-style
	projectile
	yasnippet
	)
      )

(setq my:el-get-packages
      (append my:el-get-packages
	      (loop for src in el-get-sources collect (el-get-source-name src))))
(el-get 'sync my:el-get-packages)

(provide 'packages-kit)
