;; Switch between buffers with S-arrow
;;(windmove-default-keybindings 'shift)
;;(setq windmove-wrap-around t)

;; Create TAGS
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
  (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))

;; Compile program using <F5>
;; Save all unsaved files here, then compile
(global-set-key [f5] 'compile)

;; Autosave at compile
(setq compilation-ask-about-save nil)

;;Set comments color
(set-face-foreground 'font-lock-comment-face "HotPink1")

;;Debian changelog
(setq debian-changelog-mailing-address '"a.smirnov@i-free.com")
(setq debian-changelog-full-name '"Anton Smirnov")

;;Delete selection
(delete-selection-mode 1)

;;Kill all buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; Turn on C++ mode for plain-c files
(add-to-list 'auto-mode-alist '("\\.c$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(provide 'anton)
