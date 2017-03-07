(add-hook 'after-init-hook 'global-company-mode)

(setq company-async-timeout 5)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)

(require 'company)
(require 'company-c-headers)
(require 'company-dabbrev-code)

(add-hook 'c-mode-common-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-dabbrev-code company-gtags company-c-headers))))

(global-set-key (kbd "M-/") 'company-complete)

(provide 'company-kit)
