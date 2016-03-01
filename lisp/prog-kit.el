;; file-specific mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; '(compilation-window-height nil)
;; '(column-number-mode t)

(show-paren-mode t)

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
  ;; (linum-mode)
  (c-set-style "mycodingstyle")
  (irony-mode)
  )
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

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

(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs "~/.emacs.d/el-get/yasnippet/snippets/")

;; autocomplete
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
(ac-set-trigger-key "TAB")
;; (setq ac-auto-start nil)
(setq ac-use-quick-help nil)
;; (add-to-list 'ac-modes 'octave-mode)
;; (add-to-list 'ac-sources '(ac-source-clang-async))

(defun ac-cc-mode-setup ()
  ;; (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

;; (global-auto-complete-mode 1)

;; (add-hook 'after-init-hook 'global-company-mode)

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))

;; (setq company-async-timeout 50)
;; (setq company-idle-delay nil)

;; company mode
;; (add-hook 'after-init-hook 'global-company-mode)

;; (eval-after-load 'company
;;   '(progn
;;      (add-to-list 'company-backends 'company-c-headers 'company-anaconda)
;;      ))

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
  ;; (local-set-key "\M-\r" 'company-semantic)
  (local-set-key "\M-\r" 'company-irony)
  ;; (idle-highlight-mode t)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
;; (add-hook 'scheme-mode-hook 'my-cedet-hook)
;; (add-hook 'erlang-mode-hook 'my-cedet-hook)

(when (string-match "i686-pc-linux-gnu" system-configuration)
(semantic-add-system-include "/usr/include/c++/5")
(semantic-add-system-include "usr/include/i386-linux-gnu/c++/5")
(semantic-add-system-include "usr/include/c++/5/backward")
(semantic-add-system-include "usr/lib/gcc/i686-linux-gnu/5/include")
(semantic-add-system-include "usr/local/include")
(semantic-add-system-include "usr/lib/gcc/i686-linux-gnu/5/include-fixed")
(semantic-add-system-include "usr/include/i386-linux-gnu")
(semantic-add-system-include "usr/include"))

(when (string-match "apple-darwin" system-configuration)
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/7.0.2/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include")
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks (framework directory)"))

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)                 ; optional

(defun my-python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'prog-kit)
