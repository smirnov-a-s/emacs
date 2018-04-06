(setenv "PATH"
  (concat
   "c:/cygwin64/bin;"
   (getenv "PATH")))

(setq exec-path (quote ("c:/cygwin64/bin" "c:/Python36")))

(set-face-attribute 'default nil :family "Consolas" :height 120)

(provide 'windows-kit)
