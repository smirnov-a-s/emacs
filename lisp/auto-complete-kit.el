(require 'auto-complete-config)
(require 'rtags-ac)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
(ac-set-trigger-key "TAB")
;; (setq ac-auto-start nil)
(setq ac-delay 0.1)
(setq ac-auto-show-menu 0.5)
(setq ac-use-quick-help nil)

(require 'my-clang-cflags-kit)

(defun ac-cc-mode-setup ()
  ;; (setq ac-clang-cflags (append my-clang-cflags ac-clang-cflags))
  ;; (setq ac-sources '(ac-source-clang-async))
  (setq ac-sources '(ac-source-rtags))
  (add-to-list 'ac-sources 'ac-source-c-headers)
  ;; (ac-clang-launch-completion-process)
  )
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

(define-key ac-mode-map (kbd "M-RET") 'auto-complete)

(global-auto-complete-mode t)

(provide 'auto-complete-kit)
