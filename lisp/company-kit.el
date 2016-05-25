(add-hook 'after-init-hook 'global-company-mode)

;; (setq company-async-timeout 50)
;; (setq company-idle-delay nil)

(require 'company)
(require 'company-rtags)
(require 'company-c-headers)

;; (push 'company-rtags company-backends)

(add-hook 'c-mode-common-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-rtags company-c-headers))))

(global-set-key (kbd "M-RET") 'company-complete)

(provide 'company-kit)
