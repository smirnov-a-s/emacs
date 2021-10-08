(require 'projectile)
(projectile-mode)

;; (require 'helm-projectile)
;; (helm-projectile-on)

;; (setq projectile-completion-system 'helm)
(setq projectile-completion-system 'ivy)
(setq projectile-enable-caching t)

;; (setq projectile-indexing-method 'native)
(setq projectile-indexing-method 'alien)

(setq projectile-switch-project-action #'projectile-dired)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; to avoid tramp hangs
(defadvice projectile-project-root (around ignore-remote first activate)
  (unless (file-remote-p default-directory) ad-do-it))

(append '(".vscode") projectile-globally-ignored-directories)

(provide 'projectile-kit)
