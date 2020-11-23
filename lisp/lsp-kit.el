(require 'lsp)
(require 'lsp-clangd "clients/lsp-clangd")

(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

(require 'lsp-pyls "clients/lsp-pyls")
;; TODO: how to select venv?
;; (add-hook 'python-mode-hook #'lsp)

(require 'dap-python)
(setq dap-auto-configure-features '(sessions locals controls tooltip))

;; TODO:
;; * save/restore window configuration?

(provide 'lsp-kit)
