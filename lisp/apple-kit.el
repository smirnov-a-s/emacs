(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
;; (setq exec-path (quote ("/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin")))

(setq dired-use-ls-dired nil)
(setq mac-allow-anti-aliasing t)
(set-face-attribute 'default nil :height 140)
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(global-set-key [(backtab)] 'hippie-expand)
(global-set-key [s-right] 'move-end-of-line)
(global-set-key [s-left] 'move-beginning-of-line)
(global-set-key [end] 'move-end-of-line)
(global-set-key [home] 'move-beginning-of-line)

(provide 'apple-kit)
