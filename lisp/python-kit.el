(require 'company-jedi)
(require 'python-environment)

(setq jedi:environment-root "jedi")
(setq jedi:server-command '("~/.emacs.d/.python-environments/jedi/bin/jediepcserver"))

(when (featurep 'apple-kit)
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv '("--python" "/usr/local/bin/python3")))
  (setq jedi:server-args
        '("--virtual-env" "/Users/asmirnov/work/alfanum/python-env/env-3.6.2")))

(when (featurep 'linux-kit)
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv '("--python" "/usr/bin/python3"))))

(defun my-python-mode-hook()
  (add-to-list 'company-backends 'company-jedi)
  (local-set-key [f12] 'jedi:goto-definition)
  (local-set-key (kbd "C--") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "C-_") 'jedi:goto-definition-next)
  ;; (flycheck-mode)
  )
(add-hook 'python-mode-hook 'my-python-mode-hook)

(setq flycheck-python-flake8-executable "python3")
(setq flycheck-python-pycompile-executable "python3")
(setq flycheck-python-pylint-executable "python3")
(setq python-shell-virtualenv-path "/Users/asmirnov/work/alfanum/python-env/env-3.6.2/")

(provide 'python-kit)
