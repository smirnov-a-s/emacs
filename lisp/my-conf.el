;; Debian changelog
(setq debian-changelog-mailing-address '"a.smirnov@i-free.com")
(setq debian-changelog-full-name '"Anton Smirnov")

;; Compile program using <F5>
(global-set-key [f5] 'compile)

;; Set f6 to jump to next frame
(global-set-key [f6] 'next-multiframe-window)

;; Hide/show ecb-window
(global-set-key [f7] 'ecb-hide-ecb-windows)
(global-set-key [f8] 'ecb-show-ecb-windows)

;; Pop mark
(global-set-key "\C-xp" 'pop-to-mark-command)

;; Split window to show compilation results
(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h 15)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

;; Use undo-tree
;; (global-undo-tree-mode 1)

;; Autosave at compile
(setq compilation-ask-about-save nil)

;; Set comments color
;; (set-face-foreground 'font-lock-comment-face "dark green")
;; (set-face-foreground 'font-lock-comment-face "HotPink1")

;; Set delimiter color
;; (set-face-foreground 'font-lock-comment-delimiter-face "dark green")
;; (set-face-foreground 'font-lock-comment-delimiter-face "HotPink1")

;; Set basic text color
;; (set-face-attribute 'default nil :foreground "white")

;; Delete selection
(delete-selection-mode 1)

;; Enable CUA selection mode without the C-z/C-x/C-c/C-v bindings.
(cua-selection-mode 1)

;; stop creating those backup~ files
(setq make-backup-files nil)

;; stop creating those #autosave# files
(setq auto-save-default nil)

(setq default-directory "~/")

;; (require 'lua-mode)

(defun my-lua-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  )
(add-hook 'lua-mode-hook 'my-lua-hook)



(provide 'my-conf)
