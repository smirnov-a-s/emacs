;; (setq exec-path (append exec-path '("/usr/local/bin")))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; on to the visual settings
(setq inhibit-splash-screen t)	; no splash screen, thanks
(setq visible-bell t) ; no beeps please
(line-number-mode 1)	; have line numbers and
(column-number-mode 1)	; column numbers in the mode line
(delete-selection-mode 1) ; delete selected block when start typing

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Set color theme
(add-to-list 'load-path "~/.emacs.d/vendor/emacs24-inkpot")
(require 'inkpot-theme)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'essentials-kit)
(require 'apple-kit)
(require 'org-kit)
(require 'debian-kit)
(require 'russian-kit)
;; (require 'c-kit)
(require 'prog-kit)

;; Tramp settings
;; Sudo via SSH
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(server-start)
(put 'set-goal-column 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-window-height nil)
 '(custom-safe-themes
   (quote
    ("dc2ae53baca6dabf168ddc038e3c5add1a34a1947087e778e9d14f0e2d4b89a2" default)))
 '(linum-format (quote dynamic))
 '(yas-snippet-dirs (quote ("~/.emacs.d/el-get/yasnippet/snippets/")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "dark cyan"))))
 '(font-lock-string-face ((t (:background "gray16" :foreground "#ffcd8b")))))
