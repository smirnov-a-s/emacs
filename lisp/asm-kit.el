(defun my-asm-mode-hook ()
  (electric-indent-mode -1)
  (setq-default indent-tabs-mode nil)
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  (local-set-key (kbd "<S-tab>") 'indent-rigidly-left-to-tab-stop)
  (setq asm-comment-char ?#)
  (setq comment-add 0))

(add-hook 'asm-mode-hook #'my-asm-mode-hook)

(provide 'asm-kit)
