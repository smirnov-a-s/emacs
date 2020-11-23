(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; Autosave at compile
(setq compilation-ask-about-save nil)

;; (require 'google-c-style)

(defun my-c-mode-hook ()
  (setq tab-width 4)
  (setq c-tab-always-indent t)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (yas-minor-mode)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

;; CEDET
;; select which submodes we want to activate
;; (add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;; (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; Activate semantic
(semantic-mode 1)

;; Turn off tag highlighting
;; (global-semantic-highlight-func-mode -1)

(set-default 'semantic-case-fold t)

;; customisation of modes
(defun my-compile-hook ()
  (local-set-key [f5] 'compile))
(add-hook 'c-mode-common-hook 'my-compile-hook)
(add-hook 'makefile-mode-hook 'my-compile-hook)

;; (require 'rtags-kit)

(provide 'cpp-kit)
