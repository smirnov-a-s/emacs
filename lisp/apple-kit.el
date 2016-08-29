(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  ;; (set-face-font 'default "-apple-Inconsolata-medium-normal-normal-*-19-*-*-*-m-0-iso10646-1")
  ;; (set-face-font 'bold "-apple-Inconsolata-bold-normal-normal-*-19-*-*-*-m-0-iso10646-1")

  (set-face-attribute 'default nil
		      :family "Inconsolata LGC"
		      :foundry "unknown"
		      :slant 'normal
		      :weight 'normal
		      :height 163
		      :width 'normal)

  (global-set-key [(backtab)] 'hippie-expand)
  (global-set-key [s-right] 'move-end-of-line)
  (global-set-key [s-left] 'move-beginning-of-line)
  (global-set-key (kbd "M-SPC") 'set-mark-command)
  )
(provide 'apple-kit)
