(require 'auto-complete-config)
(ac-config-default)

(global-auto-complete-mode t)

(setq ac-auto-start nil)
(setq ac-auto-show-menu nil)
(setq ac-ignore-case 'smart)

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

(provide 'complete-conf)
