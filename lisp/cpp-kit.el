(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; Autosave at compile
(setq compilation-ask-about-save nil)

;; to fix compilation window splitting verticaly
(setq split-width-threshold most-positive-fixnum)

;; style
(c-add-style "mycodingstyle"
	     '((c-basic-offset . 2)
	       (tab-width . 2)
	       (c-comment-only-line-offset . 0)
	       (c-hanging-braces-alist . ((substatement-open before after)))
	       (c-offsets-alist . ((topmost-intro        . 0)
				   (topmost-intro-cont   . 0)
				   ;; (substatement         . 3)
				   ;; (substatement-open    . 0)
				   ;; (statement-case-open  . 3)
				   ;; (statement-cont       . 3)
				   ;; (access-label         . -3)
				   ;; (inclass              . 3)
				   ;; (inline-open          . 3)
				   (innamespace          . 0)
				   ))))

;; Set style for C/C++
(defun my-c-style-hook ()
  (c-set-style "mycodingstyle")
  )
(add-hook 'c-mode-hook 'my-c-style-hook)
(add-hook 'c++-mode-hook 'my-c-style-hook)

;; CEDET config
;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; Activate semantic
(semantic-mode 1)

;; Turn off tag highlighting
(global-semantic-highlight-func-mode -1)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)

;; load contrib library
(add-to-list 'load-path "~/.emacs.d/el-get/cedet/contrib/")
(require 'eassist)

(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)

;; function args
(fa-config-default)
(set-default 'semantic-case-fold t)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs "~/.emacs.d/el-get/yasnippet/snippets/")

;; customisation of modes
(defun my-compile-hook ()
  (local-set-key [f5] 'compile)
  )
(add-hook 'c-mode-common-hook 'my-compile-hook)
(add-hook 'c++-mode-common-hook 'my-compile-hook)
(add-hook 'makefile-mode-hook 'my-compile-hook)

(defun my-cpp-hook ()
  ;; (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  ;; (local-set-key [f2] 'semantic-ia-fast-jump)
  ;; (local-set-key [f5] 'compile)
  (local-set-key [f4] 'helm-projectile-find-other-file)
  (local-set-key "\C-ce" 'helm-semantic-or-imenu) ; list methods in buffer
  (local-set-key "\C-ci" 'semantic-ia-show-summary) ; show method summary
  ;; (local-set-key "\C-c\C-r" 'semantic-symref-symbol) ; find references
  )
(add-hook 'c-mode-common-hook 'my-cpp-hook)
(add-hook 'c++-mode-common-hook 'my-cpp-hook)

;; include dirs
(when (string-match "x86_64-pc-linux-gnu" system-configuration)
(semantic-add-system-include "/usr/include/c++/4.8")
(semantic-add-system-include "/usr/include/x86_64-linux-gnu/c++/4.8")
(semantic-add-system-include "/usr/include/c++/4.8/backward")
(semantic-add-system-include "/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
(semantic-add-system-include "/usr/local/include")
(semantic-add-system-include "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed")
(semantic-add-system-include "/usr/include/x86_64-linux-gnu")
(semantic-add-system-include "/usr/include")
)

(when (string-match "apple-darwin" system-configuration)
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/7.0.2/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks (framework directory)")
)

(require 'rtags-kit)

(provide 'cpp-kit)
