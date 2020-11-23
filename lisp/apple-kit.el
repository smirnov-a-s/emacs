(setenv "PATH" (concat "/usr/local/bin:" "/usr/local/opt/llvm/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin" "/usr/local/opt/llvm/bin")))
;; (setq exec-path (quote ("/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin")))

(setq dired-use-ls-dired nil)
(setq mac-allow-anti-aliasing t)
(setq frame-resize-pixelwise 1)
(setq insert-directory-program "gls")
(set-face-attribute 'default nil :family "Inconsolata LGC" :height 140)
(add-to-list 'default-frame-alist '(ns-appearance . dark))
;; (desktop-save-mode 1)

(global-set-key [(backtab)] 'hippie-expand)
(global-set-key [s-right] 'move-end-of-line)
(global-set-key [s-left] 'move-beginning-of-line)
(global-set-key [end] 'move-end-of-line)
(global-set-key [home] 'move-beginning-of-line)

(toggle-frame-maximized)

(provide 'apple-kit)
