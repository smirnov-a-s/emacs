(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/vendor/solarized-emacs")
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/solarized-emacs")

(require 'solarized-kit)
(add-hook 'after-init-hook (lambda () (load-theme 'solarized-dark t)))

;; (require 'packages-kit)
(require 'essentials-kit)

(if (string-equal system-type "darwin")
    (require 'apple-kit)
  (if (string-equal system-type "windows-nt")
      (require 'windows-kit)
    (require 'linux-kit)))
  
(require 'company-kit)
;; (require 'helm-kit)
;; (require 'projectile-kit)
;; (require 'cpp-kit)
;; (require 'org-kit)
;; (require 'python-kit)
;; (require 'russian-kit)

;; (server-start)
