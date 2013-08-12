;; Use octave mode for all *.m
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; Turn on abbrevs, auto-fill and font-lock features automatically
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (linum-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; Indent by RET
(defun RET-behaves-as-LFD ()
  (let ((x (key-binding "\C-j")))
    (local-set-key "\C-m" x)))
(add-hook 'octave-mode-hook 'RET-behaves-as-LFD)

(add-hook 'inferior-octave-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (define-key inferior-octave-mode-map [up]
              'comint-previous-input)
            (define-key inferior-octave-mode-map [down]
              'comint-next-input)))

(defun octave-send-buffer ()
  "Sends the entire buffer to the octave program."
  (interactive)
  (if (equal major-mode 'octave-mode)
      (octave-send-region (point-min) (point-max))
    (message "You can only send octave-mode buffers to octave.")))

(provide 'octave-conf)
