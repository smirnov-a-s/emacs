(require 'auto-complete-config)
(ac-config-default)

(global-auto-complete-mode t)

(setq ac-auto-start nil)
(setq ac-auto-show-menu nil)
;; (setq ac-ignore-case 'smart)
(setq ac-ignore-case nil)
;;(setq ac-quick-help-delay 0)

;; No history please
(setq ac-use-comphist nil)
;;
(setq ac-show-menu-immediately-on-auto-complete t)

(defun complete ()
  (interactive)
  (ac-start)
  (ac-show-menu)
)

;; Show menu
;;(define-key ac-mode-map "\M-/" 'complete)
(define-key ac-mode-map "\M-/" 'complete)

;; Close menu
(define-key ac-completing-map "\M-/" 'ac-stop)

;; Trigger key
(ac-set-trigger-key "TAB")

;; Give me RET please
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)

;; emacs-clang-complete-async
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

;; Add semantic sources
;; (defun my-c-mode-cedet-hook ()
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;; )
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(provide 'complete-conf)
