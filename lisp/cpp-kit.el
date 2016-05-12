;; file-specific mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

(show-paren-mode t)

;; Autosave at compile
(setq compilation-ask-about-save nil)

(global-set-key [f5] 'compile) ;; move to hook!!!

;; to fix compilation window splitting verticaly
(setq split-width-threshold most-positive-fixnum)

;; Split window to show compilation results
;; (defun my-compilation-hook ()
;;   (when (not (get-buffer-window "*compilation*"))
;;     (save-selected-window
;;       (save-excursion
;;         (let* ((w (split-window-vertically))
;;                (h (window-height w)))
;;           (select-window w)
;;           (switch-to-buffer "*compilation*")
;;           (shrink-window (- h 15)))))))
;; (add-hook 'compilation-mode-hook 'my-compilation-hook)

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
(defun my-c-mode-hook ()
  ;; (c-set-style "k&r")
  ;; (setq c-echo-syntactic-information-p t)
  ;; (setq c-basic-offset 4)
  ;; (setq tab-width 4)
  ;; (linum-mode)
  (c-set-style "mycodingstyle")
  ;; (idle-highlight-mode t)
  ;; (irony-mode)
  )
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; (defun my-c++-mode-hook ()
;;   (setq c-basic-offset 4)
;;   (setq tab-width 4)
;;   (linum-mode)
;;   ;; (setq c-echo-syntactic-information-p t)
;;   ;; (c-tab-always-indent t)
;;   )
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; CEDET config
;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; (add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)

;; Activate semantic
(semantic-mode 1)
;;(global-semantic-idle-scheduler-mode 1)

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
(defun my-cedet-hook ()
  ;; (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  ;; (local-set-key [f2] 'semantic-ia-fast-jump)
  ;; (local-set-key "\C-ct" 'helm-projectile-find-other-file)
  (local-set-key [f4] 'helm-projectile-find-other-file)
  ;; (local-set-key "\C-ce" 'moo-jump-local)
  (local-set-key "\C-ce" 'helm-semantic-or-imenu)
  (local-set-key "\C-ci" 'semantic-ia-show-summary)
  ;; (local-set-key "\C-c\C-r" 'semantic-symref-symbol)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
;; (add-hook 'scheme-mode-hook 'my-cedet-hook)
;; (add-hook 'erlang-mode-hook 'my-cedet-hook)

;; include dirs
(when (string-match "x86_64-pc-linux-gnu" system-configuration)
(semantic-add-system-include "/usr/include/c++/4.8")
(semantic-add-system-include "/usr/include/x86_64-linux-gnu/c++/4.8")
(semantic-add-system-include "/usr/include/c++/4.8/backward")
(semantic-add-system-include "/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
(semantic-add-system-include "/usr/local/include")
(semantic-add-system-include "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed")
(semantic-add-system-include "/usr/include/x86_64-linux-gnu")
(semantic-add-system-include "/usr/include"))

(when (string-match "apple-darwin" system-configuration)
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/7.0.2/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks (framework directory)"))

(provide 'cpp-kit)
