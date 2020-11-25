(setq python-shell-interpreter "python3")

(defun my-python-mode-hook ()
  (yas-minor-mode)
  )
(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'python-kit)
