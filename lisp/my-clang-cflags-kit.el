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
				   "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed"
				   "/usr/include/x86_64-linux-gnu"
				   ))
(provide 'my-clang-cflags-kit)
