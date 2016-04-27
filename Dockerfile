FROM ubuntu

# setup base system
COPY apt.sources.list /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy build-essential libssl-dev git man curl

USER root
ENV HOME /root
ENV NODE_VER_1 v0.12
ENV NODE_VER_4 v4
ENV NODE_VER_5 v5
# setup the nvm environment
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

RUN echo "Install node@${NODE_VER} finished."
RUN . ~/.nvm/nvm.sh && nvm install ${NODE_VER_1}
RUN . ~/.nvm/nvm.sh && nvm install ${NODE_VER_4}
RUN . ~/.nvm/nvm.sh && nvm install ${NODE_VER_5}
RUN echo '. ~/.nvm/nvm.sh' >> $HOME/.profile
#RUN echo 'echo "Installing node@${NODE_VER}, this may take several minutes..."' >> $HOME/.profile
#RUN echo 'nvm install ${NODE_VER}' >> $HOME/.profile
RUN echo 'nvm use ${NODE_VER}' >> $HOME/.profile
#RUN echo 'nvm alias default ${NODE_VER}' >> $HOME/.profile
#RUN echo 'echo "Install node@${NODE_VER} finished."' >> $HOME/.profile
#ENTRYPOINT ["/bin/bash", "--login"]
#CMD ["bash"]
