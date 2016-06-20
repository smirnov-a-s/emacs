;; (setq exec-path (append exec-path '("/usr/local/bin")))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; no splash screen, thanks
(setq inhibit-splash-screen t)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(line-number-mode 1)	; have line numbers and
(column-number-mode 1)	; column numbers in the mode line
(delete-selection-mode 1) ; delete selected block when start typing
(show-paren-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor")
;; (add-to-list 'load-path "~/.emacs.d/vendor/modern-cpp-font-lock")
(add-to-list 'load-path "~/.emacs.d/vendor/rtags/src")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://stable.melpa.org/packages/") t)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'inkpot-theme)
;; (require 'packages-kit)
(require 'essentials-kit)
(require 'helm-kit)
(require 'apple-kit)
(require 'org-kit)
(require 'debian-kit)
(require 'russian-kit)
(require 'cpp-kit)
;; (require 'auto-complete-kit)
(require 'company-kit)
(require 'python-kit)
;; (require 'octave-kit)
;; (require 'ede-kit)

(volatile-highlights-mode t)

;; Tramp settings
;; Sudo via SSH
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(server-start)
(put 'set-goal-column 'disabled nil)

;; (when (string-match "x86_64-pc-linux-gnu" system-configuration)
;;   (set-face-attribute 'default nil
;; 		      :family "Inconsolata LGC"
;; 		      :foundry "unknown"
;; 		      :slant 'normal
;; 		      :weight 'normal
;; 		      :height 143
;; 		      :width 'normal)
;;   )
