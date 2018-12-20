(require 'python-environment)

;; (if (featurep 'apple-kit)
;;     (setq jedi:environment-virtualenv
;;           (append python-environment-virtualenv
;;                   '("--python" "/usr/local/bin/python3"))
;;           (setq jedi:server-args
;;                 '("--virtual-env" "/Users/asmirnov/work/alfanum/python-env/env3.6")))
;;   (if (featurep 'linux-kit)
;;       (setq jedi:environment-virtualenv
;;             (append python-environment-virtualenv
;;                     '("--python" "/usr/local/bin/python3")))
;;        (message "python-environment-virtualenv for windows-kit is not set!")))

(setq jedi:environment-root "jedi")
(setq jedi:environment-virtualenv
      (append python-environment-virtualenv
              '("--python" "/usr/local/bin/python3")))
(setq jedi:server-args
      '("--virtual-env" "/Users/asmirnov/work/alfanum/python-env/env3.6"))

(add-hook 'python-mode-hook 'jedi:setup)

(defun my-python-mode-hook()
  (add-to-list 'company-backends 'company-jedi)
  (local-set-key [f2] 'jedi:goto-definition)
  (local-set-key (kbd "C-c <") 'jedi:goto-definition-pop-marker)
  )

(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'python-kit)
