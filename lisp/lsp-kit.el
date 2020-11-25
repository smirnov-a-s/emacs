;; https://emacs-lsp.github.io/lsp-mode/page/performance/
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(require 'lsp)
(require 'lsp-clangd "clients/lsp-clangd")

(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'c-mode-hook #'lsp-deferred)

(require 'lsp-pyls "clients/lsp-pyls")

(defun my-python-lsp-mode-hook ()
  (pyvenv-mode)
  (lsp-deferred)
  )
(add-hook 'python-mode-hook 'my-python-lsp-mode-hook)

(require 'dap-python)

;; https://github.com/emacs-lsp/dap-mode/issues/272
(if (display-graphic-p)
    (setq dap-auto-configure-features '(sessions locals controls tooltip))
  (setq dap-auto-configure-features '(sessions locals tooltip)))

;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
(setq lsp-signature-auto-activate nil)
(setq lsp-signature-render-documentation nil)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-ui-doc-show-with-cursor nil)
(setq lsp-ui-sideline-enable nil)

(provide 'lsp-kit)
