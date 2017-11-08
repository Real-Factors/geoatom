#!/usr/bin/env bash

#FROM dataquestio/ubuntu-base
FROM phusion/baseimage:0.9.22
CMD ["/sbin/my_init"]

# --------------------Environment Variables Setup--------------------
ENV TERM=xterm
ENV LANG en_US.UTF-8

# --------------------OS Setup-----------------------------------
RUN apt-get update -y && apt-get install build-essential -y

ADD apt-packages.txt /tmp/apt-packages.txt
RUN xargs -a /tmp/apt-packages.txt apt-get install -y
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# --------------------SSH--------------------
RUN rm -f /etc/service/sshd/down

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh


# --------------------Languages & Scripting--------------------
RUN pip install --upgrade pip
RUN pip install virtualenv
RUN /usr/local/bin/virtualenv /opt/rf --distribute --python=/usr/bin/python3
RUN pip install virtualenvwrapper

ADD /requirements/ /tmp/requirements

RUN /opt/rf/bin/pip install -r /tmp/requirements/pre-requirements.txt
RUN /opt/rf/bin/pip install -r /tmp/requirements/requirements.txt

RUN useradd --create-home --home-dir /home/rf --shell /bin/bash rf
RUN chown -R rf /opt/rf
RUN adduser rf sudo

# ADD run_ipython.sh /home/rf
# RUN chmod +x /home/rf/run_ipython.sh
# RUN chown rf /home/rf/run_ipython.sh

ADD .bashrc.template /home/rf/.bashrc
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8888
RUN usermod -a -G sudo rf
RUN echo "rf ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER rf
RUN mkdir -p /home/rf/scripts
ENV HOME=/home/rf
ENV SHELL=/bin/bash
ENV USER=rf
VOLUME /home/rf/scripts
WORKDIR /home/rf/scripts

CMD ["/home/rf/run_ipython.sh"]
