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

;; (local-set-key "\C-ce" 'moo-jump-local)
(global-set-key "\C-xb" 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor nil
 ;; helm-gtags-highlight-candidate nil
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode
(require 'helm-gtags)

(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c h b") 'helm-bookmarks)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(defun my-helm-cpp-hook ()
  (local-set-key [f2] 'helm-gtags-find-tag)
  (local-set-key [f4] 'helm-projectile-find-other-file)
  (local-set-key "\C-ce" 'helm-semantic-or-imenu) ; list methods in buffer
  (local-set-key "\C-c\C-r" 'helm-gtags-find-rtag) ; find references
  (local-set-key "\C-c\C-s" 'helm-gtags-find-symbol) ; find symbol
  )
(add-hook 'c-mode-common-hook 'my-helm-cpp-hook)

(global-set-key "\C-c\C-g" 'helm-projectile-grep) ; grep through project files

;; prevent helm from searching in some files
(setq grep-find-ignored-files (append grep-find-ignored-files '("*.d" "*.o" "GPATH" "GRTAGS" "GTAGS" "Makefile" "*.gz" "*.dia" "*.docx" "*.vcxproj" "*.ui" "*.png" "*.dox" "*.suo" "*.user" "*.vcproj" "*.exe" "*.Exe" "*.EXE" "*.exp" "*.dll" "*.DLL" "*.pdb" "*.ilk" "*.fs" "*.vs" "*.fx" "*.sln" "*.aqt" "*.odt" "*.docx" "*.rc" "*.rc2" "*.txt" "*.TXT" "*.doc" "*.fp" "*.vp" "*.dia" "*.bmp" "*.BMP" "*.ico" "*.manifest" "*.cd" "*.suo" "*.ncb")))
(setq grep-find-ignored-directories (append grep-find-ignored-directories '("build")))

;; (setq projectile-globally-ignored-files (append projectile-globally-ignored-files '("*.user")))
(setq projectile-globally-ignored-file-suffixes
      (append projectile-globally-ignored-file-suffixes '("user" "vcproj" "exe" "Exe" "EXE" "exp" "dll"	"DLL" "pdb" "ilk" "fs" "vs" "fx" "sln" "aqt" "odt" "docx" "rc" "rc2" "txt" "TXT" "doc" "fp" "vp" "dia" "bmp" "BMP" "ico" "manifest" "cd" "suo" "ncb")))

;; (setq projectile-indexing-method 'native)
(setq projectile-indexing-method 'alien)

(provide 'helm-kit)
