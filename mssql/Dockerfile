# hadolint ignore=DL3006
# Using latest is prone to errors if the image will ever update. Pin the version explicitly to a release tag
# hadolint ignore=DL3007
ARG BUILD_FROM=mcr.microsoft.com/azure-sql-edge:latest
# hadolint ignore=DL3007
FROM mcr.microsoft.com/azure-sql-edge:latest
# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
USER root
# Copy root filesystem
COPY rootfs /
# hadolint ignore=DL3008 Pin versions in apt get install. Instead of `apt-get install <package>` use `apt-get install <package>=<version>`
RUN apt-get install -y --no-install-recommends jq
RUN chmod +x /usr/bin/start_sqlserver.sh
ENV MSSQL_DATA_DIR=/data/db
ENV MSSQL_BACKUP_DIR=/data/backup
ENV MSSQL_LOG_DIR=/data/log
ENV MSSQL_DUMP_DIR=/data/dump
ENV MSSQL_MASTER_DATA_FILE=/data/master/master.mdf
ENV MSSQL_MASTER_LOG_FILE=/data/master/mastlog.ldf
ENV MSSQL_ERROR_LOG_FILE=/data/log/error.log
USER mssql
CMD /opt/mssql/bin/launchpadd -usens=false -enableOutboundAccess=true -usesameuser=true -sqlGroup root -- -reparentOrphanedDescendants=true -useDefaultLaunchers=false & /app/asdepackage/AsdePackage & /usr/bin/start_sqlserver.sh
# hadolint ignore=DL3025 Use arguments JSON notation for CMD and ENTRYPOINT arguments
LABEL io.hass.name="MSSQL"
LABEL io.hass.description="MSSQL Server add-on for Home Assistant"
LABEL io.hass.arch="${BUILD_ARCH}"
LABEL io.hass.type="addon"
LABEL io.hass.version=${BUILD_VERSION}
LABEL maintainer="Oscar Calvo <@ocalvo>"
LABEL org.opencontainers.image.title="MSSQL"
LABEL org.opencontainers.image.description="MSSQL add-on for Home Assistant"
LABEL org.opencontainers.image.vendor="MSSQL Home Assistant Add-on"
LABEL org.opencontainers.image.authors="Oscar Calvo <@ocalvo>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.url="https://github.com/ocalvo/addon-mssql"
LABEL org.opencontainers.image.source="https://github.com/ocalvo/addon-mssql"
LABEL org.opencontainers.image.documentation="https://raw.githubusercontent.com/ocalvo/addon-mssql/main/README.md"
LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.revision=${BUILD_REF}
LABEL org.opencontainers.image.version=${BUILD_VERSION}
