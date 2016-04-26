(global-ede-mode t)

(when (string-match "i686-pc-linux-gnu" system-configuration)
(ede-cpp-root-project "rsdk"
                :name "rsdk"
                :file "/home/anton/work/rsdk/libs/radar_sdk/.projectile"
                :include-path '("/home/anton/work/rsdk/libs/radar_sdk/include"
				))

(ede-cpp-root-project "rsdk-test"
                :name "rsdk-test"
                :file "/home/anton/work/mystuff/c++/rsdk_test/.projectile"
                :include-path '("/home/anton/work/rsdk/libs/radar_sdk/include"
				)))

;; (ede-cpp-root-project "Demos"
;;                 :name "Demos Project"
;;                 :file "/home/anton/work/my_stuff/c++/demos/.projectile"
;;                 :include-path '("./"
;; 				)))

(when (string-match "apple-darwin" system-configuration)
(ede-cpp-root-project "Demos"
                :name "Demos Project"
                :file "/Users/asmirnov/work/mystuff/c++/demos/.projectile"
                :include-path '("./"
				)))

(provide 'ede-kit)
