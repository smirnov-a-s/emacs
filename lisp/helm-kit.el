;; helm
(require 'helm-config)
(helm-mode 1)

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)

(global-set-key (kbd "M-m") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key "\C-xb" 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x f") 'helm-recentf)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(provide 'helm-kit)
