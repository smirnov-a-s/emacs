;; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (require 'package)
;; (package-initialize)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

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
(require 'lsp-kit)
(require 'asm-kit)
(require 'russian-kit)

(server-start)
