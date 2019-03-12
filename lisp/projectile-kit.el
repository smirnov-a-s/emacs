(require 'projectile)
(projectile-mode)

;; (require 'helm-projectile)
;; (helm-projectile-on)

;; (setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)

;; (global-set-key "\C-c\C-g" 'helm-projectile-grep)

;; prevent helm from searching in some files
;; (setq grep-find-ignored-files (append grep-find-ignored-files '("*.d" "*.o" "GPATH" "GRTAGS" "GTAGS" "Makefile" "*.gz" "*.dia" "*.docx" "*.vcxproj" "*.ui" "*.png" "*.dox" "*.suo" "*.user" "*.vcproj" "*.exe" "*.Exe" "*.EXE" "*.exp" "*.dll" "*.DLL" "*.pdb" "*.ilk" "*.fs" "*.vs" "*.fx" "*.sln" "*.aqt" "*.odt" "*.docx" "*.rc" "*.rc2" "*.txt" "*.TXT" "*.doc" "*.fp" "*.vp" "*.dia" "*.bmp" "*.BMP" "*.ico" "*.manifest" "*.cd" "*.suo" "*.ncb" "*.mgc" "*.log")))
;; (setq grep-find-ignored-directories (append grep-find-ignored-directories '("build")))

;; (setq projectile-globally-ignored-files (append projectile-globally-ignored-files '("*.user")))
;; (setq projectile-globally-ignored-file-suffixes
;;       (append projectile-globally-ignored-file-suffixes '("user" "vcproj" "exe" "Exe" "EXE" "exp" "dll"	"DLL" "pdb" "ilk" "fs" "vs" "fx" "sln" "aqt" "odt" "docx" "rc" "rc2" "txt" "TXT" "doc" "fp" "vp" "dia" "bmp" "BMP" "ico" "manifest" "cd" "suo" "ncb" "mgc" "log")))

(setq projectile-indexing-method 'native)
;; (setq projectile-indexing-method 'alien)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; to avoid tramp hangs
(defadvice projectile-project-root (around ignore-remote first activate)
    (unless (file-remote-p default-directory) ad-do-it))

(provide 'projectile-kit)
