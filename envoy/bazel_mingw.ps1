cd C:\bazel_workspace

bazel clean --expunge

Copy-Item -Recurse -Force -ErrorAction Continue c:\bazel_workspace c:\bazel_temp

cd C:\bazel_temp

bazel build --config=mingw $args

New-Item -Force -Type Directory c:\bazel_workspace\bin

Copy-Item -Recurse -Force c:\bazel_temp\bazel-bin\*\*.exe c:\bazel_workspace\bin\
