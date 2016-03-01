;; autocomplete
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
(ac-set-trigger-key "TAB")
;; (setq ac-auto-start nil)
(setq ac-use-quick-help nil)
;; (add-to-list 'ac-modes 'octave-mode)
;; (add-to-list 'ac-sources '(ac-source-clang-async))

(defun ac-cc-mode-setup ()
  ;; (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-clang-cflags (append '("-std=c++11") ac-clang-cflags))
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup))
  ;; (global-auto-complete-mode t))

(define-key ac-mode-map (kbd "M-RET") 'auto-complete)

(my-ac-config)

(global-auto-complete-mode 1)

(provide 'auto-complete-kit)
