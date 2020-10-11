ARG BUILD_FROM=mcr.microsoft.com/azure-sql-edge:latest
# hadolint ignore=DL3006
FROM mcr.microsoft.com/azure-sql-edge:latest

# Copy root filesystem
COPY rootfs /

# Setup base
RUN apk add --no-cache coreutils=8.32-r0 wget=1.20.3-r1

#RUN /bin/sh -c /opt/mssql/bin/launchpadd -usens=false -enableOutboundAccess=true -usesameuser=true -sqlGroup root -- -reparentOrphanedDescendants=true -useDefaultLaunchers=false & /app/asdepackage/AsdePackage & /opt/mssql/bin/sqlservr

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="MSSQL" \
    io.hass.description="MSSQL Server add-on for Home Assistant" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Oscar Calvo <@ocalvo>" \
    org.opencontainers.image.title="MSSQL" \
    org.opencontainers.image.description="MSSQL add-on for Home Assistant" \
    org.opencontainers.image.vendor="MSSQL Home Assistant Add-on" \
    org.opencontainers.image.authors="Oscar Calvo <@ocalvo>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/ocalvo/addon-mssql" \
    org.opencontainers.image.source="https://github.com/ocalvo/addon-mssql" \
    org.opencontainers.image.documentation="https://raw.githubusercontent.com/ocalvo/addon-mssql/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
