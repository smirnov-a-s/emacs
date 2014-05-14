;; Yasnippets
(require 'yasnippet)
(yas-global-mode 1)

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
(global-undo-tree-mode 1)

;; Autosave at compile
(setq compilation-ask-about-save nil)

;; Set comments color
(set-face-foreground 'font-lock-comment-face "HotPink1")

;; Set delimiter color
(set-face-foreground 'font-lock-comment-delimiter-face "HotPink1")

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

;; Use spaces when indenting
(setq-default indent-tabs-mode nil)

;; cc-mode
(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  (c-set-style "linux")
  ;; (c-toggle-auto-newline 1)
  (setq c-echo-syntactic-information-p t)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq default-directory "~/")

(setq ibuffer-default-sorting-mode 'major-mode)

(provide 'anton)
