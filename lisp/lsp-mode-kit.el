(require 'lsp)
(require 'lsp-clangd "clients/lsp-clangd")

(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

(provide 'lsp-mode-kit)
