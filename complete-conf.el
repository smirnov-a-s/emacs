(require 'auto-complete-config)
(require 'auto-complete-clang)
(require 'auto-complete-c-headers)
(require 'yasnippet)

(yas-global-mode 1)

;; default auto-complete config
(ac-config-default)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)

(ac-set-trigger-key "TAB")

(define-key ac-mode-map  "\M-/" 'auto-complete)

(defun my-c-mode-cedet-hook ()
  ;; (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic)
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  ;; (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1")
  ;; (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")
  ;; (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")
)
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(provide 'complete-conf)
