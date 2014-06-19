;; auto-complete
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(require 'auto-complete-c-headers)
(require 'auto-complete-clang)

;; CEDET
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
(ac-config-default)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)

(ac-set-trigger-key "TAB")

(define-key ac-mode-map  "\M-/" 'auto-complete)

;; auto-complete sources
(defun my-c-mode-ac-sources-hook ()

  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-clang)
)
(add-hook 'c-mode-common-hook 'my-c-mode-ac-sources-hook)

(global-auto-complete-mode t)

;; SRecode
(global-srecode-minor-mode 1)

;; EDE
(global-ede-mode 1)
;; (ede-enable-generic-projects)

(semantic-add-system-include "/Users/asmirnov/work/mystuff/cplusplus/demos/my_inc" 'c-mode)
(semantic-add-system-include "/Users/asmirnov/work/mystuff/cplusplus/demos/my_inc" 'c++-mode)

(provide 'cedet-conf)
