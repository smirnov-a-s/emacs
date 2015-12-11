(global-ede-mode t)

(when (string-match "i686-pc-linux-gnu" system-configuration)
(ede-cpp-root-project "Signal"
                :name "Signal Project"
                :file "/home/anton/buildroot/home/user/repos/git_project/signal/signal/.projectile"
                :include-path '("./"
				))

(ede-cpp-root-project "Demos"
                :name "Demos Project"
                :file "/home/anton/work/my_stuff/c++/demos/.projectile"
                :include-path '("./"
				)))

(provide 'ede-kit)
