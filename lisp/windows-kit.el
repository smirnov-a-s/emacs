(setenv "PATH"
  (concat
   "c:/cygwin64/bin;"
   (getenv "PATH")))

(setq exec-path (quote ("c:/cygwin64/bin" "c:/Python36")))

(set-face-attribute 'default nil :family "Consolas" :height 120)

(setq-default buffer-file-coding-system 'utf-8-unix)

(provide 'windows-kit)
