;; helm
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

;; prevent helm from searching in .d files
(add-to-list 'grep-find-ignored-files "*.d")

(provide 'helm-kit)
