;; helm
(require 'helm-projectile)
(require 'helm-config)
(helm-mode 1)

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)

(global-set-key (kbd "M-m") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key "\C-xb" 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x f") 'helm-recentf)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key "\C-c\C-g" 'helm-projectile-grep) 

;; prevent helm from searching in some files
(setq grep-find-ignored-files (append grep-find-ignored-files '("*.d" "*.o" "GPATH" "GRTAGS" "GTAGS" "Makefile" "*.gz" "*.dia" "*.docx" "*.vcxproj" "*.ui" "*.png" "*.dox" "*.suo" "*.user" "*.vcproj" "*.exe" "*.Exe" "*.EXE" "*.exp" "*.dll" "*.DLL" "*.pdb" "*.ilk" "*.fs" "*.vs" "*.fx" "*.sln" "*.aqt" "*.odt" "*.docx" "*.rc" "*.rc2" "*.txt" "*.TXT" "*.doc" "*.fp" "*.vp" "*.dia" "*.bmp" "*.BMP" "*.ico" "*.manifest" "*.cd" "*.suo" "*.ncb" "*.mgc" "*.log")))
(setq grep-find-ignored-directories (append grep-find-ignored-directories '("build")))

(setq projectile-globally-ignored-files (append projectile-globally-ignored-files '("*.user")))
(setq projectile-globally-ignored-file-suffixes
      (append projectile-globally-ignored-file-suffixes '("user" "vcproj" "exe" "Exe" "EXE" "exp" "dll"	"DLL" "pdb" "ilk" "fs" "vs" "fx" "sln" "aqt" "odt" "docx" "rc" "rc2" "txt" "TXT" "doc" "fp" "vp" "dia" "bmp" "BMP" "ico" "manifest" "cd" "suo" "ncb" "mgc" "log")))

(setq projectile-indexing-method 'native)
;; (setq projectile-indexing-method 'alien)

(provide 'helm-kit)
