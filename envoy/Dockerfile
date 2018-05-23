FROM microsoft/windowsservercore:1803

# use chocolately for dependencies
RUN powershell.exe -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

# vcredist required by bazel
RUN choco install vcredist140 -y

RUN choco install bazel -y

RUN choco install mingw -y

# symlink mingw to abs path c:\mingw
RUN powershell -Command "New-Item -Path C:\mingw -Type SymbolicLink -Value C:\tools\mingw64"

ADD bazel_mingw.ps1 /bazel_mingw.ps1

VOLUME ["c:/bazel_workspace"]

# env vars required for bazel on windows, here to allow debugging
ENV BAZEL_SH="C:\tools\msys64\usr\bin\bash.exe"
ENV BAZEL_PYTHON="C:\Python27\python.exe"

ENTRYPOINT ["powershell", "-Command", "C:\\bazel_mingw.ps1"]
