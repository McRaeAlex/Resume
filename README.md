# Resume

This is my resume using Latex. I have also done some automation for building it.

## How it works

A docker container is built containing inotify-tools and texlive-full.
This allows me to run the code on any distro without having to worry about 
bloating my computer with unneeded packages.

The current directory is mounted into the docker container at runtime using
the `run.sh` script. The docker container will run the local `build_latex.sh`
script (to avoid having to rebuild on changes).

`build_latex.sh` looks for a ENV variable and if its TRUE it will use inotify
to rebuild the pdf on saves. If its not TRUE it will just build the pdf once
and the container will exit.