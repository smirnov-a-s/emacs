(add-hook 'org-mode-hook (lambda () 
	   (require 'org-install)
	   (define-key org-mode-map "\C-cl" 'org-store-link)
	   (define-key org-mode-map "\C-ca" 'org-agenda)
	   (setq org-log-done t)
	   (setq org-directory "~/.emacs.d/org")
	   (setq org-mobile-directory "~/Dropbox/MobileOrg")
	   (setq org-agenda-files (list "~/.emacs.d/org/i-free.org" "~/.emacs.d/org/idleness.org" "~/.emacs.d/org/home.org"))
	   (setq org-mobile-inbox-for-pull "~/.emacs.d/org/flagged.org")
	   (setq org-support-shift-select t)
	   (setq org-completion-use-ido t)
	   (setq org-modules (quote (org-bbdb org-bibtex org-docview org-info org-jsinfo org-irc org-mac-message org-vm org-collector org-depend org-mac-iCal org-mac-link-grabber org-toc)))

	   ))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(provide 'org-kit)
