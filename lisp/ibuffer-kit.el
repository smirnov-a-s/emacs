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
         ("JS" (mode . js-mode))
	 ("Lisp" (mode . emacs-lisp-mode))
	 ("Perl" (mode . perl-mode))
	 ("Python" (mode . python-mode))
	 ("Search" (or (name . "*Occur*")
		       (name . "*xref*")))
	 ("Shell" (mode . sh-mode))
	 ("Text" (mode . text-mode))
	 )))

(setq ibuffer-show-empty-filter-groups nil)

(defun my-ibuffer-mode-hook ()
  (ibuffer-switch-to-saved-filter-groups "filter-groups")
  (define-key ibuffer-mode-map (kbd "/ d") 'ibuffer-filter-by-directory)
  )
(add-hook 'ibuffer-mode-hook 'my-ibuffer-mode-hook)

(provide 'ibuffer-kit)
