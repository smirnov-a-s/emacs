;; Use IDO if installed
(if (fboundp 'ido-mode) (ido-mode 1))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Save a list of recent files visited.
(recentf-mode 1)

;; If non-nil, `kill-line' with no arg at beg of line kills the whole line.
(setq kill-whole-line t)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
;;(global-auto-revert-mode 1)

;; Use readable buffer designations when names are the same
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(setq exec-path (quote ("/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin")))

;;??
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this) ;; needs mark-multiple (M-x el-get-install RET multiple-cursors RET)

(setq file-name-coding-system 'utf-8)

(setq confirm-kill-emacs 'yes-or-no-p) ;; Ask for confirmation when leaving Emacs

(setq frame-title-format '(buffer-file-name "%f" ("%b"))) ;; set the title bar to show file name if available, buffer name otherwise

(require 'bar-cursor)
(bar-cursor-mode)
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(add-to-list 'auto-mode-alist '("\\rfc\\[0-9\\]+.txt$" . irfc-mode))

;;
;; Set f6 to jump to next frame
(global-set-key [f6] 'next-multiframe-window)
(global-set-key (kbd "M-<left>") 'previous-buffer)
(global-set-key (kbd "M-<right>") 'next-buffer)

;; Pop mark
(global-set-key "\C-xp" 'pop-to-mark-command)

;; Delete selection
(delete-selection-mode 1)

;; Enable CUA selection mode without the C-z/C-x/C-c/C-v bindings.
(cua-selection-mode 1)

;; stop creating those backup~ files
(setq make-backup-files nil)

;; stop creating those #autosave# files
(setq auto-save-default nil)

(setq default-directory "~/")

;; file-specific mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

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

(local-set-key "\C-ce" 'moo-jump-local)
(global-set-key "\C-xb" 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)
(add-to-list 'ac-modes 'octave-mode)
(global-auto-complete-mode 1)

;; company mode
;; (add-hook 'after-init-hook 'global-company-mode)

;; (eval-after-load 'company
;;   '(progn
;;      (add-to-list 'company-backends 'company-c-headers 'company-anaconda)
;;      ))

;; (global-set-key (kbd "M-/") 'company-complete-common)
;; (global-set-key (kbd "M-/") 'company-complete)

(electric-indent-mode t)
(electric-pair-mode t)

;; iedit
(define-key global-map (kbd "C-c ;") 'iedit-mode)

(provide 'essentials-kit)
