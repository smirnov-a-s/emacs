;; autocomplete
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
(ac-set-trigger-key "TAB")
;; (setq ac-auto-start nil)
(setq ac-use-quick-help nil)
;; (add-to-list 'ac-modes 'octave-mode)
;; (add-to-list 'ac-sources '(ac-source-clang-async))

;; (defun my-ac-irony-setup ()
;;   (setq 'ac-sources 'ac-source-irony)
;;   (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async))
;; (add-hook 'irony-mode-hook 'my-ac-irony-setup)

(defun ac-cc-mode-setup ()
  (setq ac-clang-cflags (append '("-std=c++11") ac-clang-cflags))
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup))

(define-key ac-mode-map (kbd "M-RET") 'auto-complete)

(my-ac-config)

(global-auto-complete-mode t)

(provide 'auto-complete-kit)
