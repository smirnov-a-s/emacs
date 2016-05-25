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

(require 'company)
(require 'company-rtags)

;; (push 'company-rtags company-backends)

(add-hook 'c-mode-common-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-rtags))))

(global-set-key (kbd "M-RET") 'company-complete)

(global-company-mode)

(provide 'company-kit)
