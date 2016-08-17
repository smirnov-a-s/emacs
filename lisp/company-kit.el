(add-hook 'after-init-hook 'global-company-mode)

(setq company-async-timeout 5)
(setq company-idle-delay 0.2)
;; (setq company-idle-delay 3)

(require 'company)
(require 'company-rtags)
(require 'company-c-headers)
(require 'company-dabbrev-code)
(require 'ycmd)
(ycmd-setup)
(require 'company-ycmd)
;; (company-ycmd-setup)

(set-variable 'ycmd-server-command '("python" "/home/anton/.emacs.d/vendor/ycmd/ycmd"))

(add-hook 'c++-mode-hook 'ycmd-mode)

(add-hook 'c-mode-common-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-ycmd company-c-headers))))

;; mode local company backends
;; (add-hook 'c-mode-common-hook
;;             (lambda ()
;;               (set (make-local-variable 'company-backends) '(company-rtags company-c-headers))))

(add-to-list 'company-c-headers-path-user "~/boost_1_61_0_build/include")

;; (global-set-key (kbd "M-RET") 'company-complete)
(global-set-key (kbd "M-RET") 'company-rtags)
(global-set-key (kbd "C-c RET") 'company-gtags)
;; (global-set-key (kbd "M-/") 'company-dabbrev-code)
;; (global-set-key (kbd "M-/") 'company-ycmd)
(global-set-key (kbd "M-/") 'company-complete)

(provide 'company-kit)
