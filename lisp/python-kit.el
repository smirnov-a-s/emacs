(require 'company-jedi)
(require 'python-environment)

(setq jedi:environment-root "jedi")
(setq jedi:server-command '("~/.emacs.d/.python-environments/jedi/bin/jediepcserver"))

(when (featurep 'apple-kit)
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv '("--python" "/usr/local/bin/python3")))
  (setq jedi:server-args
        '("--virtual-env" "/Users/asmirnov/work/alfanum/python-env/env3.6.2")))

(when (featurep 'linux-kit)
  (setq jedi:environment-virtualenv
        (append python-environment-virtualenv '("--python" "/usr/bin/python3"))))

(defun my-python-mode-hook()
  (add-to-list 'company-backends 'company-jedi)
  (local-set-key [f12] 'jedi:goto-definition)
  (setq jedi:server-command '("~/.emacs.d/.python-environments/jedi/bin/jediepcserver"))
(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'python-kit)
