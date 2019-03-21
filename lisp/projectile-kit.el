(require 'projectile)
(projectile-mode)

;; (require 'helm-projectile)
;; (helm-projectile-on)

;; (setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)

(setq projectile-indexing-method 'native)
;; (setq projectile-indexing-method 'alien)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; to avoid tramp hangs
(defadvice projectile-project-root (around ignore-remote first activate)
    (unless (file-remote-p default-directory) ad-do-it))

(provide 'projectile-kit)
