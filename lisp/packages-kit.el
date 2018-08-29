(setq my:el-get-packages
      '(el-get
        cl-lib
        cmake-mode
        company-mode
        company-c-headers
        ctable
        dash
        deferred
        emacs-async
        epc
        epl
        fuzzy
        google-c-style
        ido-completing-read-plus
        ido-vertical-mode
        iedit
        memoize
        multiple-cursors
        popup
        projectile
	yasnippet
        s
        smex
        volatile-highlights
	)
      )

(setq my:el-get-packages
      (append my:el-get-packages
	      (loop for src in el-get-sources collect (el-get-source-name src))))
(el-get 'sync my:el-get-packages)

(provide 'packages-kit)
