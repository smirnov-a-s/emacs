(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-count-format "(%d/%d) ")

(defun swiper-region ()
  "Use current region if active for swiper search"
  (interactive)
  (if (use-region-p)
      (let ((substr (buffer-substring-no-properties (region-beginning) (region-end))))
        (when (not (string-equal "" (string-trim substr)))
          (deactivate-mark)
          (swiper substr)))
    (swiper)))

(global-set-key (kbd "C-s") 'swiper-region)
;; (global-set-key "\C-s" 'swiper)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

(provide 'ivy-kit)
