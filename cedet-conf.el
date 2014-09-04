(require 'yasnippet)
(yas-global-mode 1)

(electric-indent-mode 1)

;; (require 'auto-complete-config)
;; (require 'auto-complete-c-headers)
;; (require 'auto-complete-clang)

;; irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)

;; cc-mode
(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  (c-set-style "linux")
  (setq c-echo-syntactic-information-p t)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; (defun my-c++-mode-hook ()
;;   (c-set-style "stroustrup")
;;   (c-set-offset 'substatement-open 0)
;;   (setq c-echo-syntactic-information-p t)
;; )
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook)

(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

;; (add-to-list 'c-mode-hook
;;              (lambda () (setq c-syntactic-indentation nil)))

;; (add-to-list 'c++-mode-hook
;;              (lambda () (setq c-syntactic-indentation nil)))


;; Treat some files as c++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . c++-mode))

;; CEDET config
;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)

;; Activate semantic
(semantic-mode 1)
(global-semantic-idle-scheduler-mode 1)
;; Turn off tag highlighting
(global-semantic-highlight-func-mode -1)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)

;; load contrib library
(add-to-list 'load-path "~/.emacs.d/el-get/cedet/contrib/")
(require 'eassist)

;; customisation of modes
(defun my-cedet-hook ()
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'scheme-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
(add-hook 'erlang-mode-hook 'my-cedet-hook)

(defun my-c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)

(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))

;; default auto-complete config
;; (ac-config-default)

;; (setq ac-auto-start nil)
;; (setq ac-quick-help-delay 0.5)

;; (ac-set-trigger-key "TAB")

;; (define-key ac-mode-map  "\M-/" 'auto-complete)
;; (define-key ac-mode-map  "\M-/" 'ac-complete-clang)

;; (define-key ac-mode-map  "\M-/" 'company-complete)
;; (global-set-key (kbd "M-/") 'company-complete)
(global-set-key (kbd "M-/") 'company-complete-common)
;; (define-key ac-mode-map  (kbd "M-RET") 'ac-complete-irony-async)

;; setting the ac-clang-flags to include these default include pathes
;; (setq ac-clang-flags
;;       (mapcar (lambda (item)(concat "-I" item))
;;               (split-string
;;                "
;; /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1
;; /usr/local/include
;; /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/5.1/include
;; /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
;; /usr/include
;; /usr/local/Cellar/glew/1.10.0/include/GL
;; /usr/local/Cellar/glfw3/3.0.4/include/GLFW
;; /System/Library/Frameworks/OpenGL.framework/Headers
;; /opt/local/include/SOIL
;; "
;;                )))

;; irony
;; auto-complete sources
;; (defun my-c-mode-ac-sources-hook ()
  ;; (add-to-list 'ac-sources 'ac-source-gtags)
  ;; (add-to-list 'ac-sources 'ac-source-semantic)

  ;; (add-to-list 'ac-sources 'ac-source-clang)

  ;; (add-to-list 'ac-sources 'ac-source-yasnippet)
;; )
;; (add-hook 'c-mode-common-hook 'my-c-mode-ac-sources-hook)

;; (defun my-ac-irony-setup ()
  ;; be cautious, if yas is not enabled before (auto-complete-mode 1), overlays
  ;; *may* persist after an expansion.
  ;; (yas-minor-mode 1)
  ;; (auto-complete-mode 1)

  ;; (add-to-list 'ac-sources 'ac-source-irony)
  ;; (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async))
;; (add-hook 'irony-mode-hook 'my-ac-irony-setup)

;; (global-auto-complete-mode t)

;; company
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; SRecode
(global-srecode-minor-mode 1)

;; EDE
(global-ede-mode 1)
;; (ede-enable-generic-projects)

;; provide some additional include path for semantic
(semantic-add-system-include "/Users/asmirnov/work/mystuff/cplusplus/demos/my_inc" 'c-mode)
(semantic-add-system-include "/Users/asmirnov/work/mystuff/cplusplus/demos/my_inc" 'c++-mode)
(semantic-add-system-include "/usr/local/Cellar/glew/1.10.0/include/GL" 'c++-mode)
(semantic-add-system-include "/usr/local/Cellar/glfw3/3.0.4/include/GLFW" 'c++-mode)
(semantic-add-system-include "/System/Library/Frameworks/OpenGL.framework/Headers" 'c++-mode)
(semantic-add-system-include "/opt/local/include/SOIL" 'c++-mode)

(provide 'cedet-conf)
