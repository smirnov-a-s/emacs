;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq default-directory "~/" )

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

;; have line numbers and
(line-number-mode 1)
;; column numbers in the mode line
(column-number-mode 1)
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

;; highlights changes to the buffer caused by commands such as undo, yank/yank-pop, etc
(volatile-highlights-mode t)
;; (electric-indent-mode t)
;; (electric-pair-mode t)
(setq-default indent-tabs-mode nil)

;; Use readable buffer designations when names are the same
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; delete trailing whitespaces and require final newline
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (setq require-final-newline t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this) ;; needs mark-multiple (M-x el-get-install RET multiple-cursors RET)
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key "\C-xp" 'pop-to-mark-command) ;; Pop mark
(global-set-key (kbd "C-c ;") 'iedit-mode) ;; iedit

;; (define-key dired-mode-map (kbd "a") 'dired-find-file)
;; (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-find-file
;; (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-dwim-target t)

(require 'bar-cursor)
(bar-cursor-mode)
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;; Tramp settings
;; Sudo via SSH
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(put 'set-goal-column 'disabled nil)

;; increase ibuffer name column width from 18 to 40
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 40 40 :left :elide)
	      " "
              (size 9 -1 :right)
	      " "
              (mode 16 16 :left :elide)
	      " " filename-and-process)
        (mark " "
	      (name 16 -1)
	      " " filename)))

;; ibuffer filter groups (http://martinowen.net/blog/2010/02/03/tips-for-emacs-ibuffer.html)
;; (setq ibuffer-saved-filter-groups
;;       '(("home"
;; 	 ("emacs-config" (or (filename . ".emacs.d")
;; 			     (filename . "emacs-config")))
;;          ("martinowen.net" (filename . "martinowen.net"))
;; 	 ("Org" (or (mode . org-mode)
;; 		    (filename . "OrgMode")))
;;          ("code" (filename . "code"))
;; 	 ("Web Dev" (or (mode . html-mode)
;; 			(mode . css-mode)))
;; 	 ("Subversion" (name . "\*svn"))
;; 	 ("Magit" (name . "\*magit"))
;; 	 ("ERC" (mode . erc-mode))
;; 	 ("Help" (or (name . "\*Help\*")
;; 		     (name . "\*Apropos\*")
;; 		     (name . "\*info\*"))))))

(setq ibuffer-saved-filter-groups
      '(("filter-groups"
	 ("Conf" (or (mode . conf-space-mode)
		     (mode . conf-colon-mode)
		     (mode . conf-unix-mode)))
	 ("Dired" (mode . dired-mode))
	 ("Emacs" (or (name . "*scratch*")
		      (name . "*Messages*")
		      (name . "*Completions*")
		      (name . "*Help*")
		      (name . "*Warnings*")))
	 ("Lisp" (mode . emacs-lisp-mode))
	 ("Perl" (mode . perl-mode))
	 ("Python" (mode . python-mode))
	 ("Search" (or (name . "*Occur*")
		       (name . "*xref*")))
	 ("Shell" (mode . sh-mode))
	 ("Text" (mode . text-mode))
	 )))

(setq ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "filter-groups")))

(require 'xah-find)

;; ediff restore windows layout after running ediff session
(defvar my-ediff-last-windows nil)
(defun my-store-pre-ediff-winconfig ()
  (setq my-ediff-last-windows (current-window-configuration)))
(defun my-restore-pre-ediff-winconfig ()
  (set-window-configuration my-ediff-last-windows))
(add-hook 'ediff-before-setup-hook #'my-store-pre-ediff-winconfig)
(add-hook 'ediff-quit-hook #'my-restore-pre-ediff-winconfig)

(provide 'essentials-kit)
