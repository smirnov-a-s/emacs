(setq python-shell-interpreter "python3")

;; (setq flycheck-python-flake8-executable "python3")
;; (setq flycheck-python-pycompile-executable "python3")
;; (setq flycheck-python-pylint-executable "python3")
;; (setq python-shell-virtualenv-path "/Users/asmirnov/work/alfanum/python-env/env-3.6.2/")

(defun my-python-mode-hook ()
  (yas-minor-mode)
  )
(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'python-kit)
