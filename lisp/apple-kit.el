;; (setenv "PATH" (concat "/usr/local/bin:" "/usr/local/opt/llvm/bin:" (getenv "PATH")))
;; (setq exec-path (quote ("/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin")))

(setenv "PATH"
        (concat
         "/usr/local/opt/texinfo/bin:"
         "/usr/local/bin:"
         "/usr/local/opt/llvm/bin:"
         (getenv "PATH")))

(setq exec-path (append exec-path '("/usr/local/opt/texinfo/bin:" "/usr/local/bin" "/usr/local/opt/llvm/bin")))
(setq dired-use-ls-dired nil)
(setq mac-allow-anti-aliasing t)
(setq frame-resize-pixelwise 1)
(setq insert-directory-program "gls")
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

(set-face-attribute 'default nil :family "Inconsolata LGC" :height 140)
(add-to-list 'default-frame-alist '(ns-appearance . dark))
;; (desktop-save-mode 1)

(global-set-key [(backtab)] 'hippie-expand)
(global-set-key [end] 'move-end-of-line)
(global-set-key [home] 'move-beginning-of-line)
(global-set-key (kbd "s-right") 'move-end-of-line)
(global-set-key (kbd "s-left") 'move-beginning-of-line)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-l") 'goto-line)
(global-set-key (kbd "s-w") 'kill-buffer-and-window)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-/") 'comment-region)

(toggle-frame-maximized)

(provide 'apple-kit)
