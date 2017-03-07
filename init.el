(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(add-hook 'after-init-hook (lambda () (load-theme 'solarized-dark t)))

;; (require 'inkpot-theme)
(require 'essentials-kit)
;; (require 'packages-kit)
(require 'helm-kit)
;; (require 'apple-kit)
;; (require 'org-kit)
;; (require 'russian-kit)
(require 'cpp-kit)
(require 'company-kit)
;; (require 'python-kit)

(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e04d69983f3c4d566208359ded69c90e53baffdcd80721b78fb6182e7fb2c5cd" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
