(add-to-list 'load-path "~/.emacs.d/vendor/rtags/src")
(require 'rtags)

(setq rtags-path "~/.emacs.d/vendor/rtags/build/bin")
;; (setq rtags-path "C:/Users/antsmi/.emacs.d/vendor/rtags/build/bin")

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)

(setq rtags-use-helm t)

(defun my-rtags-hook ()
  (local-set-key [f2] 'rtags-find-symbol-at-point)
  (local-set-key "\C-c\C-r" 'rtags-find-all-references-at-point)
  (local-set-key (kbd "C-c <") 'rtags-location-stack-back)
  (local-set-key (kbd "C-c >") 'rtags-location-stack-forward)
  (local-set-key "\C-c\C-i" 'rtags-print-symbol-info)
  (local-set-key "\C-c\C-t" 'rtags-symbol-type)
  )
(add-hook 'c-mode-common-hook 'my-rtags-hook)

;; (require 'flycheck-rtags)

;; (defun my-flycheck-rtags-setup ()
;;   (flycheck-select-checker 'rtags)
;;   (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;   (setq-local flycheck-check-syntax-automatically nil))
;; (add-hook 'c-mode-common-hook 'my-flycheck-rtags-setup)

(provide 'rtags-kit)
