(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(require 'auto-complete-c-headers)
(require 'auto-complete-clang)

;; default auto-complete config
(ac-config-default)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)

(ac-set-trigger-key "TAB")

(define-key ac-mode-map  "\M-/" 'auto-complete)

(provide 'complete-conf)
