;; (defun copy-file-name-to-clipboard-from-dirname (dirname)
;;   "Copy the current buffer file name to the clipboard starting from given dirname."
;;   (interactive "sdirname:")
;;   (let ((filename (if (equal major-mode 'dired-mode)
;;                       default-directory
;;                     (buffer-file-name))))
;;     (let ((filename-substr (substring filename (string-match dirname filename) nil)))
;;       (when filename-substr
;;         (kill-new filename-substr)
;;         (message "Copied buffer file name '%s' to the clipboard." filename-substr)))))


;; (hlt-nonempty-region-p)

;; hlt-highli

;; (defun my-highlight-region (&optional prefix)
;;   (interactive)
;;   (when (hlt-nonempty-region-p)
;;     (highlight-regexp 'prefix)))

;; (global-set-key (kbd "M-<f8>") 'my-highlight-region)

;; (when (use-region-p)
;;   (message "%s" (buffer-substring-no-properties (region-beginning) (region-end))))

;; (highlight-regexp REGEXP &optional FACE)


;; TODO:
;; - buffer-substring-no-properties shouldn't be empty
;; - when called with active region, put cursor to the end of the region making the region not active
;; (defun my-highlight-region (arg)
;;   (interactive "P")
;;   (if (not arg)
;;       (if (use-region-p)
;;           (highlight-regexp (buffer-substring-no-properties (region-beginning) (region-end)))
;;         (call-interactively #'highlight-regexp))  
;;     (progn (setq current-prefix-arg nil) (call-interactively #'unhighlight-regexp))))  
;; (global-set-key (kbd "C-<f8>") 'my-highlight-region)



(defun my-highlight-region (arg)
  (interactive "P")
  (if (not arg)
      (call-interactively #'highlight-regexp)
    (progn (setq current-prefix-arg nil) (call-interactively #'unhighlight-regexp))))
(global-set-key (kbd "C-<f8>") 'my-highlight-region)

(defun display-prefix (arg)
  "Display the value of the raw prefix arg."
  (interactive "P")
  (if (not arg)
      (message "no prefix")
    (message "arg is %s" arg))
  )



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

(progn (isearch-mode t) (isearch-yank-string "region"))

(defun my-isearch-from-region ()
  (interactive)
  (if (use-region-p)
      (let ((substr (buffer-substring-no-properties (region-beginning) (region-end))))
        (when (not (string-equal "" (string-trim substr)))
          (goto-char (region-beginning))
          (deactivate-mark)
          (isearch-mode t)
          (isearch-yank-string substr)
          ))
    (call-interactively #'isearch-forward))
  )





(current-buffer)



;; (if (window-minibuffer-p)
;;     (setq frame-title-format '(current-buffer)))


;; (setq frame-title-format '(if (not (window-minibuffer-p))                              
;;                               (buffer-file-name "%f" ("%b"))
;;                             (message "test")))

;; (setq frame-title-format '(buffer-file-name "%f" ("%b")))


;; (setq frame-title-format ')

;; '(buffer-file-name "%f" ("%b"))


;; (setq frame-title-format '(buffer-file-name "%f" ("%b")))

(setq frame-title-format '("%f" ("%b")))

;; (setq frame-title-format '("%f"))

(setq frame-title-format '(if (window-minibuffer-p)
                              "ololo"))

(setq frame-title-format '(if (window-minibuffer-p)
                              (buffer-file-name)))


(buffer-file-name (window-buffer (minibuffer-selected-window)))

(setq frame-title-format '(buffer-file-name (window-buffer (minibuffer-selected-window))))
(setq frame-title-format '((buffer-file-name (window-buffer (minibuffer-selected-window)))))
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

(setq frame-title-format '("%f"))

"ololo"


(defun my-test ()
  (interactive)  
  (message "%s" (buffer-file-name (window-buffer (minibuffer-selected-window))))
  )

(setq frame-title-format (buffer-file-name (window-buffer (minibuffer-selected-window))))

(format "%s" (buffer-file-name (window-buffer (minibuffer-selected-window))))

(buffer-file-name)

(setq frame-title-format "%f")

(defun set-frame-title-format-to-buffer-name ()
  (setq frame-title-format
        (buffer-file-name
         (window-buffer
          (minibuffer-selected-window)))))

(defun restore-frame-title-format ()
  (setq frame-title-format "%f"))

(add-hook 'minibuffer-setup-hook 'set-frame-title-format-to-buffer-name)
(add-hook 'minibuffer-exit-hook 'restore-frame-title-format)
(setq frame-title-format '(buffer-file-name "%f" ("%b")))



(buffer-file-name (window-buffer (minibuffer-selected-window)))

;; set the title bar to show file name if available, buffer name otherwise
(setq frame-title-format '("%f" '(buffer-file-name (window-buffer (minibuffer-selected-window)))))

(setq frame-title-format '("%f" ("%b")))

(setq frame-title-format '(buffer-file-name "%f" (buffer-file-name (window-buffer (minibuffer-selected-window)))))

(defun temp2 ()
  (buffer-file-name (window-buffer (minibuffer-selected-window)))
  )

(setq frame-title-format '(buffer-file-name "%f" (temp2)))


'("a" 1 3)

(car '(1 2 3))
(cdr '(1 2 3))

(cadr '(1 2 3))









(defun unpop-to-mark-command ()
    "Unpop off mark ring. Does nothing if mark ring is empty."
    (interactive)
    (when mark-ring
      (let ((pos (marker-position (car (last mark-ring)))))
        (if (not (= (point) pos))
            (goto-char pos)
          (setq mark-ring (cons (copy-marker (mark-marker)) mark-ring))
          (set-marker (mark-marker) pos)
          (setq mark-ring (nbutlast mark-ring))
          (goto-char (marker-position (car (last mark-ring))))))))



mark 1

mark 2

mark 3


(dap-register-debug-template "My App"
  (list :type "python"
        :args "-i"
        :cwd nil
        :env '(("DEBUG" . "1"))
        :target-module (expand-file-name "~/work/mystuff/python/tmp/np_test.py")
        :request "launch"
        :name "My App"))


(setq ido-show-dot-for-dired nil)


(defun ido-switch-to-dired (&optional removep)
  (interactive "P")
  (setq ido-cur-list
        (remove-if-not (lambda (buf-name)
                         (setq buf (get-buffer buf-name))
                         (when (buffer-live-p buf)
                           (with-current-buffer buf
                             (eq major-mode 'dired-mode))))
                       ido-cur-list)))

(defun bind-ido-keys ()
  "Keybindings for ido mode."
  (define-key ido-completion-map (kbd "C-d") 'ido-switch-to-dired))

(add-hook 'ido-setup-hook #'bind-ido-keys)



(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))

;; (setq dracula-use-24-bit-colors-on-256-colors-terms t)
(setq dracula-alternate-mode-line-and-minibuffer t)
(setq dracula-alternate-mode-line-and-minibuffer nil)


"grep  -nH --null -e "

(setq grep-command "grep  -nH --null -e ")
(setq grep-command "ggrep  -nH --null -e ")

;; check dired mode

(defun dired-copy-basename-at-point-to-cb ()
  (interactive)
  (message (dired-get-filename "no-dir"))
  )

(defun dired-copy-abspath-at-point-to-cb ()
  (interactive)
  (message (dired-get-filename))
  )



;;;;;;;;;;;;;;;;;;;;;;;

;; https://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs


(defun copy-file-name-to-clipboard ()
  "Copy the current buffer full file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to clipboard." filename))))

(defun copy-file-name-to-clipboard-substr (dirname)
  "Copy the current buffer file name to the clipboard starting from given substring."
  (interactive "sCopy filename to clipboard starting from: ")
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (let ((filename-substr (substring filename (string-match dirname filename) nil)))
      (when filename-substr
        (kill-new filename-substr)
        (message "Copied buffer file name '%s' to clipboard." filename-substr)))))








(defun utest (arg1 &optional arg2 arg3)
  "Sample command to test `universal-argument'."
  (interactive
   (cond
    ((equal current-prefix-arg nil) ; no C-u
     (list 1 nil nil))
    ((equal current-prefix-arg '(4)) ; C-u
     (list 1 2 nil))
    ((equal current-prefix-arg 2) ; C-u 2
     (list 1 2 3))
    ;; more special case here

    (t ; all other cases, prompt
     (list
      (read-string "arg1:" )
      (read-string "arg2:" )
      (read-string "arg3:" )))))

  ;; now, all the parameters of your function is filled.
  ;; code body here

  (message "args are: %s %s %s" arg1 arg2 arg3)
  ;;
  )


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




(defun copy-file-name-to-clipboard-substr (dirname)
  "Copy the current buffer file name to the clipboard starting from given substring."
  (interactive "sCopy filename to clipboard starting from: ")
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (let ((filename-substr (substring filename (string-match dirname filename) nil)))
      (when filename-substr
        (kill-new filename-substr)
        (message "Copied buffer file name '%s' to clipboard." filename-substr)))))
