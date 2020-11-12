(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/vendor/flx")
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/emacs")

(require 'essentials-kit)

(if (string-equal system-type "darwin")
    (require 'apple-kit)
  (if (string-equal system-type "windows-nt")
      (require 'windows-kit)
    (require 'linux-kit)))

(require 'company-kit)
(require 'projectile-kit)
(require 'cpp-kit)
;; (require 'org-kit)
(require 'python-kit)
;; (require 'russian-kit)
;; (require 'dap-mode-kit)

(server-start)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    '(centaur-tabs test-simple loc-changes load-relative let-alist))
;;  '(safe-local-variable-values
;;    '((projectile-project-name . "init_pe")
;;      (projectile-project-name . "tobi_pe"))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
