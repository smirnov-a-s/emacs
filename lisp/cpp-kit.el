(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; Autosave at compile
(setq compilation-ask-about-save nil)

;; to fix compilation window splitting verticaly
(setq split-width-threshold most-positive-fixnum)

;; style
;; (c-add-style "mycodingstyle"
;; 	     '((c-basic-offset . 2)
;; 	       (tab-width . 2)
;; 	       (c-comment-only-line-offset . 0)
;; 	       (c-hanging-braces-alist . ((substatement-open before after)))
;; 	       (c-offsets-alist . ((topmost-intro        . 0)
;; 				   (topmost-intro-cont   . 0)
;; 				   ;; (substatement         . 3)
;; 				   ;; (substatement-open    . 0)
;; 				   ;; (statement-case-open  . 3)
;; 				   ;; (statement-cont       . 3)
;; 				   ;; (access-label         . -3)
;; 				   ;; (inclass              . 3)
;; 				   ;; (inline-open          . 3)
;; 				   (innamespace          . 0)
;; 				   ))))

;; Set style for C/C++
;; (defun my-c-style-hook ()
;;   (c-set-style "mycodingstyle")
;;   )
;; (add-hook 'c-mode-hook 'my-c-style-hook)
;; (add-hook 'c++-mode-hook 'my-c-style-hook)

(require 'google-c-style)

(defun my-c-style-hook ()
  (setq tab-width 2)
  )
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'my-c-style-hook)

;; (require 'modern-cpp-font-lock)
;; (modern-c++-font-lock-global-mode t)

;; CEDET
;; (require 'cedet-devel-load)

;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; Activate semantic
(semantic-mode 1)
;; (require 'semantic/ia)
;; (require 'semantic/bovine/gcc)

;; load contrib library
;; (add-to-list 'load-path "~/.emacs.d/el-get/cedet/contrib/")
;; (require 'eassist)

;; Turn off tag highlighting
(global-semantic-highlight-func-mode -1)

;; (semanticdb-enable-gnu-global-databases 'c-mode t)
;; (semanticdb-enable-gnu-global-databases 'c++-mode t)

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
(add-hook 'makefile-mode-hook 'my-compile-hook)

;; (require 'my-semantic-include-kit)
(require 'rtags-kit)

(provide 'cpp-kit)
