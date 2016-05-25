(when (string-match "apple-darwin" system-configuration)
  (setq my-clang-cflags '(
			  "-std=c++11"
			  ))

  (setq achead:include-directories '(
				     "."
				     "/usr/include"
				     "/usr/local/include"
				     "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1"
				     "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/7.3.0/include"
				     "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include"
				     "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include"
				     "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks (framework directory)"
				     ))
  )

(when (string-match "x86_64-pc-linux-gnu" system-configuration)
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
  )

(provide 'my-clang-cflags-kit)
