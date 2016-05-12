;; autocomplete
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
(ac-set-trigger-key "TAB")
;; (setq ac-auto-start nil)
(setq ac-use-quick-help nil)
;; (add-to-list 'ac-modes 'octave-mode)
;; (add-to-list 'ac-sources '(ac-source-clang-async))

(when (string-match "apple-darwin" system-configuration)
  (add-to-list 'load-path "~/.emacs.d/vendor/emacs-clang-complete-async")
  (require 'auto-complete-clang-async)
  (setq ac-clang-complete-executable "~/.emacs.d/vendor/emacs-clang-complete-async/clang-complete")
  (defun ac-cc-mode-setup ()
    (setq ac-clang-cflags (append '("-std=c++11") ac-clang-cflags))
    (setq ac-sources '(ac-source-clang-async))
    (ac-clang-launch-completion-process))
  )

(when (string-match "x86_64-pc-linux-gnu" system-configuration)
  (setq my-clang-cflags '(
			  "-std=c++11"
			  "-I/home/anton/work/rsdk/libs/radar_sdk"
			  "-I/home/anton/work/rsdk/libs/radar_sdk/include"
			  ))

  (setq achead:include-directories '(
				     "."
				     "/usr/include"
				     "/usr/local/include"
				     "/usr/include/c++/4.8"
				     "/usr/include/x86_64-linux-gnu/c++/4.8"
				     "/usr/include/c++/4.8/backward"
				     "/usr/lib/gcc/x86_64-linux-gnu/4.8/include"
				     "/usr/local/include"
				     "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed"
				     "/usr/include/x86_64-linux-gnu"
				     ))

  (defun ac-cc-mode-setup ()
    (setq ac-clang-cflags (append my-clang-cflags ac-clang-cflags))
    ;; (setq ac-clang-cflags (append '("-std=c++11" "-I/home/anton/work/rsdk/libs/radar_sdk/include") ac-clang-cflags))
    ;; (setq ac-clang-cflags (append '("-I/home/anton/work/rsdk/libs/radar_sdk/include") ac-clang-cflags))
    (setq ac-sources '(ac-source-clang-async))
    (ac-clang-launch-completion-process))
  )

(defun my-ac-config ()
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup))

(define-key ac-mode-map (kbd "M-RET") 'auto-complete)

(my-ac-config)

(global-auto-complete-mode t)

(provide 'auto-complete-kit)
