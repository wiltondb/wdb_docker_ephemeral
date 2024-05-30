FROM rockylinux:9
RUN dnf update -y && \
    dnf install epel-release -y && \
    dnf install 'dnf-command(copr)' -y && \
    dnf copr enable wiltondb/wiltondb -y && \
    dnf update -y && \
    dnf install wiltondb -y && \
    dnf clean all
COPY ./wiltondb-setup /var/lib/pgsql/wiltondb-setup
USER postgres
RUN bash /var/lib/pgsql/wiltondb-setup
EXPOSE 1433 5432
ENTRYPOINT ["/usr/bin/postgres", "-D", "/var/lib/pgsql/data"]
