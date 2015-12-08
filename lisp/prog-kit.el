;; Autosave at compile
(setq compilation-ask-about-save nil)

(global-set-key [f5] 'compile)

;; Split window to show compilation results
(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h 15)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

;; style
(c-add-style "mycodingstyle"
	     '((c-basic-offset . 4)
	       (tab-width . 4)
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
  (linum-mode)
  (c-set-style "mycodingstyle")
  )
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

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

(defun my-octave-mode-hook ()
  ;; (idle-highlight-mode t)
  ;; (highlight-symbol-mode t)
  )
(add-hook 'octave-mode-hook 'my-octave-mode-hook)

;; autocomplete
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
;; (ac-set-trigger-key "TAB")
;; (setq ac-auto-start nil)
;; (setq ac-use-quick-help nil)
;; (add-to-list 'ac-modes 'octave-mode)
;; (add-to-list 'ac-sources '(ac-source-semantic ac-source-irony))
;; (global-auto-complete-mode 1)

(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; customisation of modes
(defun my-cedet-hook ()
  ;; (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key [f2] 'semantic-ia-fast-jump)
  ;; (local-set-key "\C-ct" 'helm-projectile-find-other-file)
  (local-set-key [f4] 'helm-projectile-find-other-file)
  ;; (local-set-key "\C-ce" 'moo-jump-local)
  (local-set-key "\C-ce" 'helm-semantic-or-imenu)
  (local-set-key "\C-ci" 'semantic-ia-show-summary)
  (local-set-key "\C-c\C-r" 'semantic-symref-symbol)
  ;; (local-set-key "\M-\r" 'ac-complete-irony-async)
  ;; (local-set-key "\M-\r" 'irony-completion-at-point-async)
  ;; (local-set-key "\M-\r" 'ac-complete-semantic)
  (local-set-key "\M-\r" 'company-semantic)
  ;; (idle-highlight-mode t)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
;; (add-hook 'scheme-mode-hook 'my-cedet-hook)
;; (add-hook 'erlang-mode-hook 'my-cedet-hook)


(semantic-add-system-include "/usr/include/c++/5")
;; (semantic-add-system-include "usr/include/i386-linux-gnu/c++/5")
;; (semantic-add-system-include "usr/include/c++/5/backward")
;; (semantic-add-system-include "usr/lib/gcc/i686-linux-gnu/5/include")
;; (semantic-add-system-include "usr/local/include")
;; (semantic-add-system-include "usr/lib/gcc/i686-linux-gnu/5/include-fixed")
;; (semantic-add-system-include "usr/include/i386-linux-gnu")
;; (semantic-add-system-include "usr/include")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(provide 'prog-kit)
