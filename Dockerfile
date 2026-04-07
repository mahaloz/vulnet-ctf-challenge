FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        build-essential \
        wget \
        xz-utils \
        login \
        inetutils-inetd \
        libpam0g-dev \
        libreadline-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://ftp.gnu.org/gnu/inetutils/inetutils-2.7.tar.gz \
    && tar -xf inetutils-2.7.tar.gz \
    && cd inetutils-2.7 \
    && ./configure --prefix=/usr --with-pam \
    && make -j"$(nproc)" \
    && make install \
    && cd .. && rm -rf inetutils-2.7 inetutils-2.7.tar.gz

RUN /usr/libexec/telnetd --version 2>&1 | head -1

RUN useradd -m -s /bin/bash ctfuser \
    && echo "ctfuser:ctfpassword" | chpasswd

RUN echo "FLAG{CVE-2026-24061_telnetd_USER_env_bypass}" > /flag \
    && chown root:root /flag \
    && chmod 400 /flag

RUN echo "telnet stream tcp nowait root /usr/libexec/telnetd telnetd" \
        >> /etc/inetd.conf

EXPOSE 23

CMD ["/usr/libexec/inetd", "-d", "/etc/inetd.conf"]
