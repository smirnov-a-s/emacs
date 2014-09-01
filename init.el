;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; on to the visual settings
(setq inhibit-splash-screen t)	; no splash screen, thanks
(setq visible-bell t) ; no beeps please
(line-number-mode 1)	; have line numbers and
(column-number-mode 1)	; column numbers in the mode line
(delete-selection-mode 1) ; delete selected block when start typing

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; add cc-mode (cc-mode not updated with the latest version)
(add-to-list 'load-path "~/.emacs.d/cc-mode")
(add-to-list 'load-path "~/.emacs.d/glsl-mode")

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
;; (color-theme-twilight)
;; (color-theme-solarized-dark)
(color-theme-solarized-light)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'essentials-kit)
(require 'apple-kit)
(require 'org-kit)
(require 'debian-kit)
(require 'russian-kit)

;; my
(require 'cc-mode)
(require 'glsl-mode)
(require 'my-conf)

(require 'cedet-conf)

;;;;; Tramp settings
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
 '(custom-safe-themes (quote ("dc2ae53baca6dabf168ddc038e3c5add1a34a1947087e778e9d14f0e2d4b89a2" default)))
 '(ecb-auto-activate nil)
 '(ecb-auto-expand-tag-tree nil)
 '(ecb-auto-update-methods-after-save t)
 '(ecb-display-image-icons-for-semantic-tags t)
 '(ecb-font-lock-tags t)
 '(ecb-highlight-tag-with-point nil)
 '(ecb-highlight-tag-with-point-delay 0.25)
 '(ecb-layout-name "left9")
 '(ecb-methods-filter-replace-existing (quote never))
 '(ecb-methods-menu-sorter (quote identity))
 '(ecb-methods-separate-prototypes nil)
 '(ecb-options-version "2.40")
 '(ecb-process-non-semantic-files t)
 '(ecb-show-only-positioned-tags t)
 '(ecb-source-path (quote ("~/work/mystuff/utils/src/")))
 '(ecb-tip-of-the-day nil)
 '(ecb-toggle-layout-sequence (quote ("left9" "leftsrc")))
 '(ecb-tree-buffer-style (quote ascii-guides))
 '(ecb-tree-do-not-leave-window-after-select nil)
 '(ecb-use-speedbar-instead-native-tree-buffer nil)
 '(ecb-windows-width 0.25)
 '(ede-project-directories (quote ("/Users/asmirnov/work/mystuff/resample/src" "/Users/asmirnov" "/Users/asmirnov/work/mystuff/tmp_proj" "/Users/asmirnov/work/mystuff")))
 '(irony-server-build-dir "~/.emacs.d/irony-mode/server/build/")
 '(irony-server-install-prefix "/usr/local/bin/irony-server")
 '(yas-snippet-dirs (quote ("~/.emacs.d/el-get/yasnippet/snippets/")) nil (yasnippet)))

;; (ecb-activate)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "#81908f" :inverse-video nil :underline nil :slant normal :weight normal)))))
