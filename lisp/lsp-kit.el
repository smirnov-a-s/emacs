;; https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-idle-delay 0.1)

(require 'lsp)
(require 'lsp-clangd "clients/lsp-clangd")

(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'c-mode-hook #'lsp-deferred)

(require 'lsp-pyls "clients/lsp-pyls")

(defun my-python-lsp-mode-hook ()
  (setenv "WORKON_HOME" "$HOME/.pyenv/versions" t)
  (pyvenv-mode)
  (lsp-deferred)
  )
(add-hook 'python-mode-hook 'my-python-lsp-mode-hook)

(require 'dap-python)

;; https://github.com/emacs-lsp/dap-mode/issues/272
(if (display-graphic-p)
    (setq dap-auto-configure-features '(sessions locals expressions controls tooltip))
  (setq dap-auto-configure-features '(sessions locals expressions tooltip)))


(add-hook 'dap-mode-hook
          (lambda ()
            (local-set-key (kbd "<f5>") 'dap-debug)
            (local-set-key (kbd "<f9>") 'dap-breakpoint-toggle)
            (local-set-key (kbd "<f10>") 'dap-next)
            (local-set-key (kbd "<f11>") 'dap-step-in)
            (local-set-key (kbd "<S-f11>") 'dap-step-out)
            ))

;; TODO:
;; * don't show "server log compilation window"?
;; * show/hide dap windows?
;; (defun my-dap-stopped (session)
;;   (delete-windows-on "*train server log*"))
;; (add-hook 'dap-stopped-hook 'my-dap-stopped)

;; (defun my-dap-session-created-hook (session)
;;   (dap-ui-expressions))
;; (add-hook 'dap-session-created-hook 'my-dap-session-created-hook)

;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
(setq lsp-signature-auto-activate nil)
(setq lsp-signature-render-documentation nil)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-ui-doc-show-with-cursor nil)
(setq lsp-ui-sideline-enable nil)
;; TODO: make this mode-local?
(setq lsp-completion-enable-additional-text-edit nil)
(setq lsp-enable-on-type-formatting nil)
(setq lsp-enable-indentation nil)

(provide 'lsp-kit)
