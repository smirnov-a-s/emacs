;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)

;; Tag folding
;; Load tag folding
(load-file "~/.emacs.d/el-get/cedet/contrib/semantic-tag-folding.el")
(require 'semantic-tag-folding)

;; Activate semantic
(semantic-mode 1)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)

;; Can't set it global, so...
(defun my-semantic-hook ()
  (semantic-tag-folding-mode 1))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

;; load contrib library
(require 'eassist)

;; customisation of modes
(defun cedet-hook ()
  ;;(local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  ;; open ac popup instead of cedet's
  (local-set-key [(control return)] 'complete)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  ;; tag folding key bindings
  (local-set-key (kbd "C-c <left>") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "C-c <right>") 'semantic-tag-folding-show-block)
  )
(add-hook 'c-mode-common-hook 'cedet-hook)
(add-hook 'lisp-mode-hook 'cedet-hook)
(add-hook 'scheme-mode-hook 'cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'cedet-hook)
(add-hook 'erlang-mode-hook 'cedet-hook)

(defun c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'c-mode-cedet-hook)

(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)

(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))

;; SRecode
(global-srecode-minor-mode 1)

;; EDE
(global-ede-mode 1)
(ede-enable-generic-projects)

;; Turn off tag highlighting
(global-semantic-highlight-func-mode -1)

(provide 'cedet-config)
