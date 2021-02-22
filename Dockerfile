FROM ubuntu:20.04

# This ensures we never have to interact with the command line
ENV DEBIAN_FRONTEND noninteractive
# Install the required packages
RUN apt-get update
RUN apt-get install -y texlive-full
RUN apt-get install -y inotify-tools

# Run the script to either continously rebuld to run the build once then exit
WORKDIR /resume
ENTRYPOINT [ "./scripts/build_latex.sh" ]