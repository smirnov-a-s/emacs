(add-hook 'after-init-hook 'global-company-mode)

(setq company-async-timeout 5)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)

(require 'company)
;; (require 'company-rtags)
(require 'company-c-headers)
(require 'company-dabbrev-code)
;; (require 'ycmd)
;; (ycmd-setup)
;; (require 'company-ycmd)

;; (set-variable 'ycmd-server-command '("python" "/Users/asmirnov/.emacs.d/vendor/ycmd/ycmd"))
;; (set-variable 'ycmd-extra-conf-whitelist '("~/work/*"))

;; (add-hook 'c++-mode-hook 'ycmd-mode)

;; mode local company backends
;; (add-hook 'c-mode-common-hook
;;             (lambda ()
;;               (set (make-local-variable 'company-backends) '(company-rtags company-c-headers))))

;; (global-set-key (kbd "M-RET") 'company-rtags)
;; (global-set-key (kbd "C-c RET") 'company-gtags)
(global-set-key (kbd "M-/") 'company-complete)

(provide 'company-kit)
