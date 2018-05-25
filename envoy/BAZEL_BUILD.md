# Building C++ workspace with Docker+Bazel+Mingw

## Prerequisites
* C++ Bazel workspace with a flavored `mingw` toolchain 
  * Example: https://github.com/greenhouse-org/examples/tree/mingw-bazel/cpp-tutorial/stage1
* Windows Dev Machine (Dockerfile requires 1803)
* [Docker CE for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows)

## Build instructions
1. `cd ~/workspace && git clone git@github.com:cloudfoundry-incubator/windows-dev-docs`
1. `cd ~/workspace/windows-dev-docs/envoy`
1. `docker build -t bazel_mingw .`
1. `docker run -v c:/<BAZEL_WORKSPACE>:c:/bazel_workspace bazel_mingw <BAZEL_PACKAGE>`

## Debug instructions
1. `docker run -v c:/<BAZEL_WORKSPACE>:c:/bazel_workspace --entrypoint powershell bazel_mingw` 
1. `cd c:\bazel_workspace`
1. `bazel build --config=mingw <BAZEL_PACKAGE>`

### Example for stage1 app
1. `cd c:/workspace && git clone git@github.com/greenhouse-org/examples`
1. `cd c:/workspace examples && git co mingw-bazel`
1. `docker run -v c:/workspace/examples/cpp-tutorial/stage1:c:/bazel_workspace bazel_mingw //main:hello-world`
1. `c:/workspace/examples/cpp-tutorial/stage1/bin/hello-world.exe`
