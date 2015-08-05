;; Treat some files as C++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; iedit
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; helm
(require 'helm-config)
(helm-mode 1)

(global-set-key "\C-xb" 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)

;; function args
(fa-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(electric-indent-mode 1)
(electric-pair-mode 1)

;; linum mode for c++
(add-hook 'c++-mode-hook 'linum-mode)

;; init irony mode
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-common-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

;; company mode
(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company
  '(progn
     (add-to-list 'company-backends 'company-c-headers)
     ))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
;; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; (global-set-key (kbd "M-/") 'company-complete-common)
(global-set-key (kbd "M-/") 'company-complete)

;; Set style for C
(defun my-c-mode-common-hook ()
  ;; (c-set-style "k&r")
  ;; (setq c-echo-syntactic-information-p t)
  (add-hook 'c-mode-hook 'google-set-c-style)
  (add-hook 'c-mode-hook 'google-make-newline-indent)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-c++-mode-hook ()
  (add-hook 'c++-mode-hook 'google-set-c-style)
  (add-hook 'c++-mode-hook 'google-make-newline-indent)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  ;; (setq c-echo-syntactic-information-p t)
  ;; (c-tab-always-indent t)
  )
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

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

;; (setq semantic-idle-scheduler-idle-time 0.1)

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

;; customisation of modes
(defun my-cedet-hook ()
  ;; (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key [f2] 'semantic-ia-fast-jump)
  ;; (local-set-key "\C-ct" 'helm-projectile-find-other-file)
  (local-set-key [f4] 'helm-projectile-find-other-file)
  (local-set-key "\C-ce" 'moo-jump-local)
  (local-set-key "\C-ci" 'semantic-ia-show-summary)
  (local-set-key "\C-c\C-r" 'semantic-symref-symbol)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
;; (add-hook 'scheme-mode-hook 'my-cedet-hook)
;; (add-hook 'erlang-mode-hook 'my-cedet-hook)

(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)

;; (when (cedet-ectag-version-check t)
;;   (semantic-load-enable-primary-ectags-support))

;; SRecode
;; (global-srecode-minor-mode 1)

;; EDE
;; (global-ede-mode 1)
;; (ede-enable-generic-projects)

(provide 'cedet-conf)
