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
(require 'apple-kit)
;; (require 'org-kit)
(require 'russian-kit)
(require 'cpp-kit)
(require 'company-kit)
;; (require 'python-kit)

(server-start)
