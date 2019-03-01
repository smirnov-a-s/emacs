(require 'company-jedi)
(require 'python-environment)

(setq jedi:environment-root "jedi")

(when (featurep 'apple-kit)
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv
                '("--python" "/usr/local/bin/python3")))
  (setq jedi:server-args
        '("--virtual-env" "/Users/asmirnov/work/alfanum/python-env/env3.6.2")))

;; (when (featurep 'linux-kit)
;;   (setq jedi:environment-virtualenv
;;         (append python-environment-virtualenv '("--python" "/usr/bin/python3"))))

(when (featurep 'linux-kit)
  (setq py-python-command "/usr/bin/python3"))

(defun my-python-mode-hook()
  (add-to-list 'company-backends 'company-jedi)
  (local-set-key [f12] 'jedi:goto-definition)
  (local-set-key (kbd "C-c <") 'jedi:goto-definition-pop-marker))
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; (add-hook 'python-mode-hook 'jedi:setup)

(provide 'python-kit)
