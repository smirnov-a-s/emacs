(require 'rtags)

(setq rtags-path "~/.emacs.d/vendor/rtags/build/bin")

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)

(setq rtags-use-helm t)

(defun my-rtags-hook ()
  (local-set-key [f2] 'rtags-find-symbol-at-point)
  (local-set-key "\C-c\C-r" 'rtags-find-all-references-at-point)
  (local-set-key (kbd "C-c <") 'rtags-location-stack-back)
  (local-set-key (kbd "C-c >") 'rtags-location-stack-forward)
  )
(add-hook 'c-mode-common-hook 'my-rtags-hook)
(add-hook 'c++-mode-common-hook 'my-rtags-hook)

(provide 'rtags-kit)
