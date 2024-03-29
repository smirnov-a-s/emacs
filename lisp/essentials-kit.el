;; El-get init moved to early-init
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)

;; (if (display-graphic-p)
;;     (load-theme 'dracula t)
;;   (load-theme 'wombat t))

(load-theme 'zenburn t)
;; (load-theme 'dracula t)
;; (load-theme 'wombat t)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-splash-screen t)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
;; If non-nil, `kill-line' with no arg at beg of line kills the whole line.
(setq kill-whole-line t)
;; stop creating backup~ files
(setq make-backup-files nil)
;; stop creating #autosave# files
(setq auto-save-default nil)
;; Ask for confirmation when leaving Emacs
(setq confirm-kill-emacs 'yes-or-no-p)
;; coding system
(setq file-name-coding-system 'utf-8)
;; set the title bar to show file name if available, buffer name otherwise
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; when minibuffer is selected, keep showing the buffer filename
(defun set-frame-title-format-to-buffer-name ()
  (setq frame-title-format
        (buffer-file-name
         (window-buffer
          (minibuffer-selected-window)))))

(defun restore-frame-title-format ()
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(add-hook 'minibuffer-setup-hook 'set-frame-title-format-to-buffer-name)
(add-hook 'minibuffer-exit-hook 'restore-frame-title-format)

;; split horizontally
(setq split-width-threshold most-positive-fixnum)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq ns-pop-up-frames nil)
(setq calendar-week-start-day 1)
(setq-default bidi-display-reordering nil)
(setq default-directory "~/" )

(winner-mode 1)
;; have line numbers and
(line-number-mode 1)
;; column numbers in the mode line
(column-number-mode 1)
;; (global-display-line-numbers-mode 1)
;; delete selected block when start typing
(delete-selection-mode 1)
;; show matching parentheses and other characters
(show-paren-mode 1)
;; Save a list of recent files visited.
(recentf-mode 1)
;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)
;; highlights changes to the buffer caused by commands such as undo, yank/yank-pop, etc
(volatile-highlights-mode t)
(electric-indent-mode 1)
(electric-pair-mode t)
(require 'bar-cursor)
(bar-cursor-mode)
;; Use readable buffer designations when names are the same
(require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-buffer-name-style 'forward)
;; delete trailing whitespaces and require final newline
(defun untab-and-delete-trailing-spaces()
  (interactive)
  (delete-trailing-whitespace (point-min) (point-max))
  (untabify (point-min) (point-max)))

(defun my-delete-trailing-whitespace()
  (when (member major-mode '(emacs-lisp-mode python-mode sh-mode js-mode))
    (setq require-final-newline t)
    (delete-trailing-whitespace)))
;; (add-hook 'before-save-hook 'my-delete-trailing-whitespace)

(add-to-list 'auto-mode-alist '("\\.scp\\'" . conf-space-mode))

;; use IDO
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
;; use ido vertical
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
(setq ido-vertical-show-count t)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-max-dir-file-cache 0)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun prev-window ()
  (interactive)
  (other-window -1))

(defun copy-file-name-to-clipboard (&optional arg)
  "Copy the current buffer full file name to the clipboard."
  (interactive "P")
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new (if (equal current-prefix-arg nil)
                    filename
                  (setq filename (file-name-nondirectory filename))))
      (message "Copied buffer file name '%s' to clipboard." filename))))

(require 'ibuffer-kit)

;; Dired
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-dwim-target t)
(setq dired-auto-revert-buffer t)
(setq dired-deletion-confirmer #'y-or-n-p)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-clean-confirm-killing-deleted-buffers nil)
(setq dired-subtree-use-backgrounds nil)
(setq dired-listing-switches "-Alh")

(defun xah-dired-sort ()
  "Sort dired dir listing in different ways.
Prompt for a choice.
URL `http://ergoemacs.org/emacs/dired_sort.html'
Version 2018-12-23"
  (interactive)
  (let ($sort-by $arg)
    (setq $sort-by (ido-completing-read "Sort by:" '( "date" "size" "name" "dir" )))
    (cond
     ((equal $sort-by "name") (setq $arg "-Alh "))
     ((equal $sort-by "date") (setq $arg "-Alh -t"))
     ((equal $sort-by "size") (setq $arg "-Alh -S"))
     ((equal $sort-by "dir") (setq $arg "-Alh --group-directories-first"))
     (t (error "logic error 09535" )))
    (dired-sort-other $arg )))

(defun my-dired-mode-hook ()
  (dired-hide-details-mode 1)
  (setq-local auto-revert-verbose nil)
  (auto-revert-mode 1)
  (hl-line-mode)
  (define-key dired-mode-map (kbd "TAB") 'dired-subtree-toggle)
  (define-key dired-mode-map (kbd "s") 'xah-dired-sort)
  (define-key dired-mode-map (kbd "<s-down>") 'dired-find-file)
  (define-key dired-mode-map (kbd "<s-up>") 'dired-up-directory))
(add-hook 'dired-mode-hook 'my-dired-mode-hook)

(require 'dired-x)

;; Tramp settings
;; Sudo via SSH
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(put 'set-goal-column 'disabled nil)

;; ediff restore windows layout after running ediff session
(defvar my-ediff-last-windows nil)
(defun my-store-pre-ediff-winconfig ()
  (setq my-ediff-last-windows (current-window-configuration)))
(defun my-restore-pre-ediff-winconfig ()
  (set-window-configuration my-ediff-last-windows))
(add-hook 'ediff-before-setup-hook #'my-store-pre-ediff-winconfig)
(add-hook 'ediff-quit-hook #'my-restore-pre-ediff-winconfig)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(defun my-turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1))
(add-hook 'text-mode-hook 'my-turn-spell-checking-on)

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mode-map (kbd "C-.") nil)
     (define-key flyspell-mode-map (kbd "C-,") nil)
     (define-key flyspell-mouse-map [mouse-3] 'flyspell-correct-word)))

;; flycheck
(setq flycheck-display-errors-function nil)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; http://ergoemacs.org/emacs/modernization_isearch.html
(require 'subr-x)
(defun my-xah-search-current-word-at-point ()
  (interactive)
  (let ( $p1 $p2 )
    (if (use-region-p)
        (progn
          (setq $p1 (region-beginning))
          (setq $p2 (region-end)))
      (save-excursion
        (skip-chars-backward "-_A-Za-z0-9")
        (setq $p1 (point))
        (skip-chars-forward "-_A-Za-z0-9")
        (setq $p2 (point))))

    (setq mark-active nil)
    (when (< $p1 (point))
      (goto-char $p1))

    (let ((substr (buffer-substring-no-properties $p1 $p2)))
      (when (not (string-equal "" (string-trim substr)))
        (isearch-mode t)
        (isearch-yank-string substr)))))

(defun my-isearch-forward-from-region ()
  "Runs isearch-forward from active region."
  (interactive)
  (if (use-region-p)
      (let ((substr (buffer-substring-no-properties (region-beginning) (region-end))))
        (when (not (string-equal "" (string-trim substr)))
          (goto-char (region-end))
          (deactivate-mark)
          (isearch-mode t)
          (isearch-yank-string substr)))
    (call-interactively #'isearch-forward)))

(defun my-isearch-backward-from-region ()
  "Runs isearch-backward from active region."
  (interactive)
  (if (use-region-p)
      (let ((substr (buffer-substring-no-properties (region-beginning) (region-end))))
        (when (not (string-equal "" (string-trim substr)))
          (goto-char (region-beginning))
          (deactivate-mark)
          (isearch-mode nil)
          (isearch-yank-string substr)))
    (call-interactively #'isearch-backward)))

(defun my-occur-from-region ()
  "Runs isearch-forward from active region."
  (interactive)
  (if (use-region-p)
      (let ((substr (buffer-substring-no-properties (region-beginning) (region-end))))
        (when (not (string-equal "" (string-trim substr)))
          (occur substr)
          (deactivate-mark)))
    (call-interactively #'occur)))

(defun my-highlight-region (arg)
  (interactive "P")
  (if (not arg)
      (call-interactively #'highlight-regexp)
    (progn (setq current-prefix-arg nil) (call-interactively #'unhighlight-regexp))))

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq dumb-jump-prefer-searcher 'rg)

(add-hook 'suspend-hook
          (lambda () (or (y-or-n-p "Really suspend? ")
                         (error "Suspend canceled"))))

(add-hook 'suspend-resume-hook (lambda () (message "Resumed!")
                                 (sit-for 2)))

(defun find-file-ace-window ()
  "Use ace window to select a window for opening a file from dired."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (> (length (aw-window-list)) 1)
        (aw-select "" (lambda (window)
                        (aw-switch-to-window window)
                        (find-file file)))
      (find-file-other-window file))))

;; https://oremacs.com/2017/03/18/dired-ediff/
(defun ora-ediff-files ()
  (interactive)
  (let ((files (dired-get-marked-files))
        (wnd (current-window-configuration)))
    (if (<= (length files) 2)
        (let ((file1 (car files))
              (file2 (if (cdr files)
                         (cadr files)
                       (read-file-name
                        "file: "
                        (dired-dwim-target-directory)))))
          (if (file-newer-than-file-p file1 file2)
              (ediff-files file2 file1)
            (ediff-files file1 file2))
          (add-hook 'ediff-after-quit-hook-internal
                    (lambda ()
                      (setq ediff-after-quit-hook-internal nil)
                      (set-window-configuration wnd))))
      (error "no more than 2 files should be marked"))))

;; bindings
;; (global-unset-key (kbd "C-z"))
(global-set-key (kbd "<f8>") 'my-xah-search-current-word-at-point)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this) ;; needs mark-multiple (M-x el-get-install RET multiple-cursors RET)
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key (kbd "C-c a") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)
(global-set-key "\C-xp" 'pop-to-mark-command) ;; pop mark
(global-set-key (kbd "C-c ;") 'iedit-mode) ;; iedit
(global-set-key (kbd "<f7>") 'make-directory)
(global-set-key (kbd "<f9>") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)
(global-set-key (kbd "C-c s") 'window-swap-states)
;; (define-key dired-mode-map (kbd "/") 'dired-narrow)
(global-set-key (kbd "C-x C-h") 'my-highlight-region)
(global-set-key (kbd "C-s") 'my-isearch-forward-from-region)
(global-set-key (kbd "C-r") 'my-isearch-backward-from-region)
(global-set-key (kbd "M-s o") 'my-occur-from-region)
(global-set-key (kbd "M-o") 'ace-window)

(define-key dired-mode-map "o" 'find-file-ace-window)
(define-key dired-mode-map "e" 'ora-ediff-files)

(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

(provide 'essentials-kit)
