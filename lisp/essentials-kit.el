(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://stable.melpa.org/packages/") t)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(defalias 'yes-or-no-p 'y-or-n-p)

;; no splash screen, thanks
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
;; split horizontally
(setq split-width-threshold most-positive-fixnum)
(setq-default indent-tabs-mode nil)
(setq ns-pop-up-frames nil)
(setq calendar-week-start-day 1)
(setq-default bidi-display-reordering nil)
(setq default-directory "~/" )

;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; have line numbers and
(line-number-mode 1)
;; column numbers in the mode line
(column-number-mode 1)
(global-display-line-numbers-mode 1)
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
;; (electric-indent-mode t)
(electric-pair-mode t)
(require 'bar-cursor)
(bar-cursor-mode)
;; Use readable buffer designations when names are the same
(require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-buffer-name-style 'forward)
;; delete trailing whitespaces and require final newline
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (setq require-final-newline t)

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
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

;; ;; use swiper
;; (require 'ivy)
;; (ivy-mode 1)

;; (setq ivy-use-virtual-buffers t)
;; (setq ivy-count-format "(%d/%d) ")
;; (setq enable-recursive-minibuffers t)

;; (setq ivy-initial-inputs-alist ())

;; (setq ivy-re-builders-alist
;;       '((t . ivy--regex-fuzzy)))

;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "M-x") 'counsel-M-x)

;; ;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; ;; (global-set-key (kbd "<f6>") 'ivy-resume)

;; ;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; ;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; ;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; ;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; ;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; ;; (global-set-key (kbd "C-c g") 'counsel-git)
;; ;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; ;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; ;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; ;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; ;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(defun prev-window ()
  (interactive)
  (other-window -1))

;; https://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(require 'ibuffer-kit)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-*") 'mc/mark-all-like-this) ;; needs mark-multiple (M-x el-get-install RET multiple-cursors RET)
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key "\C-xp" 'pop-to-mark-command) ;; Pop mark
(global-set-key (kbd "C-c ;") 'iedit-mode) ;; iedit
(global-set-key (kbd "<f7>") 'make-directory)
(global-set-key (kbd "<f9>") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)
(global-set-key (kbd "C-c s") 'window-swap-states)
(define-key dired-mode-map (kbd "/") 'dired-narrow)
;; (define-key dired-mode-map (kbd "i") 'dired-subtree-toggle)

;; Dired
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-dwim-target t)
(setq dired-auto-revert-buffer t)
(setq dired-deletion-confirmer #'y-or-n-p)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq dired-clean-confirm-killing-deleted-buffers nil)

(defun my-dired-mode-hook ()
  (dired-hide-details-mode 1)
  (setq-local auto-revert-verbose nil)
  (auto-revert-mode 1)
  )
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
  (flyspell-mode 1)
  )
(add-hook 'text-mode-hook 'my-turn-spell-checking-on)

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mode-map (kbd "C-.") nil)
     (define-key flyspell-mode-map (kbd "C-,") nil)
     (define-key flyspell-mouse-map [mouse-3] 'flyspell-correct-word)
     )
  )

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
        (isearch-yank-string substr)))
    ))
(global-set-key (kbd "<f8>") 'my-xah-search-current-word-at-point)

(provide 'essentials-kit)
