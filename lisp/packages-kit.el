(setq my-packages
      '(ample-regexps anaphora cl-lib cmake-mode color-theme company-c-headers company-jedi company-mode ctable dash deferred dired-hacks dumb-jump egg el-get elpy emacs-async epc epl f find-file-in-project flx flycheck fuzzy fuzzy-match ghub google-c-style graphql highlight highlight-indentation highlight-symbol ht hydra ibuffer-vc idle-highlight-mode ido-completing-read-plus ido-vertical-mode iedit jedi-core json-rpc let-alist list-utils magit magit-popup markdown-mode mc memoize multiple-cursors package pkg-info popup posframe powerline projectile python-environment pythonic pyvenv request s seq smex spinner transient treepy use-package volatile-highlights with-editor yasnippet))

(el-get 'sync my-packages)

