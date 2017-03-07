(defun my-python-mode-hook()
  (add-to-list 'company-backends 'company-jedi)
  (local-set-key [f2] 'jedi:goto-definition)
  (local-set-key (kbd "C-c <") 'jedi:goto-definition-pop-marker)
  )

(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'python-kit)
