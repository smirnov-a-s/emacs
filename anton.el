(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

(setq ac-auto-start 4)

;; Switch between buffers with S-arrow
(windmove-default-keybindings 'shift)
(setq windmove-wrap-around t)

;; Create TAGS
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command 
  (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))

;; Maximize at startup
(defun toggle-fullscreen ()
;;  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

;; Compile program using <F5>
;; Save all unsaved files here, then compile
(global-set-key [f5] 'compile)

;; Autosave at compile
(setq compilation-ask-about-save nil)
 
(provide 'anton)
