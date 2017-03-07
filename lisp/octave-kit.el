(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

(defun my-octave-mode-hook ()
  ;; (idle-highlight-mode t)
  ;; (highlight-symbol-mode t)
  )
(add-hook 'octave-mode-hook 'my-octave-mode-hook)

(provide 'octave-kit)
