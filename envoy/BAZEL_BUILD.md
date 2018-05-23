# Building C++ workspace with Docker+Bazel+Mingw

## Prerequisites
* C++ Bazel workspace with a flavored `mingw` toolchain 
  * Example: https://github.com/greenhouse-org/examples/tree/mingw-bazel/cpp-tutorial/stage1
* [Docker CE for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows)
* Windows Dev Machine (Dockerfile requires 1803)

## Build instructions
1. `docker build -t bazel_mingw .`
1. `docker run -v c:/<BAZEL_WORKSPACE>:c:/bazel_workspace bazel_mingw <PACKAGE>

## Debug instructions
1. `docker run -v c:/<BAZEL_WORKSPACE>:c:/bazel_workspace --entrypoint powershell bazel_mingw 
1. `cd /bazel_workspace; bazel build --config=mingw <PACKAGE>`
