(require 'auto-complete-config)
;; (require 'auto-complete-clang)

;; emacs-clang-complete-async
(require 'auto-complete-clang-async)

(global-auto-complete-mode t)

(setq ac-auto-start nil)
;; (setq ac-auto-show-menu t)
(setq ac-ignore-case 'smart)
;; (setq ac-ignore-case nil)
(setq ac-quick-help-delay 0.5)

;; (setq ac-use-comphist nil)

;; (setq ac-show-menu-immediately-on-auto-complete t)

;; (define-key ac-mode-map  [(control tab)] 'auto-complete)

(defun complete ()
  (interactive)
  (ac-start)
  (ac-show-menu)
)

;; Show menu
(define-key ac-mode-map "\M-/" 'complete)

;; Close menu
(define-key ac-completing-map "\M-/" 'ac-stop)

;; Trigger key
(ac-set-trigger-key "TAB")

;; (define-key ac-completing-map "\t" 'ac-complete)
;; (define-key ac-completing-map "\r" nil)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  ;; Add sources
  (setq ac-sources '(ac-source-clang-async
                     ac-source-semantic))
  (ac-clang-launch-completion-process)
)

(setq ac-source-yasnippet nil)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

(provide 'complete-conf)
