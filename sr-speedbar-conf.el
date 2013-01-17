(require 'sr-speedbar)

;; turn off the ugly icons in speedbar
(setq speedbar-use-images nil)

;; open speedbar
(sr-speedbar-open)

;; add c# extentions
(speedbar-add-supported-extension ".cs")
   (add-to-list 'speedbar-fetch-etags-parse-list
    	    '("\\.cs" . speedbar-parse-c-or-c++tag))

(provide 'sr-speedbar-conf)
