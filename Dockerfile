FROM ioft/i386-ubuntu

MAINTAINER SangVH : 0.1

ENV DEBIAN_FRONTEND noninteractive
#Replace with your nearest mirror 
RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirror\.0x\.sg\/ubuntu\//g' /etc/apt/sources.list 
RUN apt-get update 
RUN apt-get install -y apt-utils
RUN apt-get install -y vim
RUN apt-get install -y binutils
RUN apt-get install -y less
RUN apt-get install -y netcat
RUN apt-get install -y gdb
RUN apt-get install -y tmux
RUN apt-get install -y git
RUN apt-get install -y python-dev
RUN apt-get install -y zsh
RUN apt-get install -y libssl-dev
RUN git clone https://github.com/longld/peda.git ~/peda 
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit 
RUN echo "DONE! debug your program with gdb and enjoy" 
RUN apt-get install -y curl wget 
RUN bash -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
RUN chsh -s $(which zsh)
RUN apt-get install -y python-pip 
RUN apt-get install -y build-essential autoconf libtool pkg-config  libffi-dev
RUN python -m pip install pwn
RUN echo "set disable-randomization off" >> ~/.gdbinit
RUN apt-get autoremove

ENTRYPOINT /bin/zsh