(add-hook 'after-init-hook 'global-company-mode)

(setq company-async-timeout 5)
;; (setq company-idle-delay nil)

(require 'company)
(require 'company-rtags)
(require 'company-c-headers)
(require 'company-dabbrev-code)

;; mode local company backends
(add-hook 'c-mode-common-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-rtags company-c-headers))))

(global-set-key (kbd "M-RET") 'company-complete)
(global-set-key (kbd "C-c RET") 'company-gtags)
(global-set-key (kbd "M-/") 'company-dabbrev-code)

(provide 'company-kit)
