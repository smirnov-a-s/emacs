;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/rtags/src")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'essentials-kit)
(require 'inkpot-theme)
;; (require 'packages-kit)
(require 'helm-kit)
(require 'apple-kit)
(require 'org-kit)
(require 'debian-kit)
(require 'russian-kit)
(require 'cpp-kit)
(require 'company-kit)
(require 'python-kit)
;; (require 'octave-kit)

(server-start)
