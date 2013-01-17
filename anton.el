;; Compile program using <F5>
(global-set-key [f5] 'compile)

;; Autosave at compile
(setq compilation-ask-about-save nil)

;;Set comments color
(set-face-foreground 'font-lock-comment-face "HotPink1")

;;Delete selection
(delete-selection-mode 1)

;;Debian changelog
(setq debian-changelog-mailing-address '"a.smirnov@i-free.com")
(setq debian-changelog-full-name '"Anton Smirnov")

(provide 'anton)
