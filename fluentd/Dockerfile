ARG base_image=fluentd:v1.12.1-debian-1.0
FROM ${base_image}

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install ruby-dev -y && \
    apt-get install gcc -y && \
    apt-get install build-essential -y && \
    apt-get clean

# # Switch back to fluent
USER fluent
VOLUME ["/app"]
# Set working directory as /app
WORKDIR /fluentd
# Copy Gemfile and run install
COPY Gemfile /fluentd
RUN bundle install

# Copy docker-entrypoint
COPY docker-entrypoint.sh /bin/
# List of ports exposed by image
EXPOSE 5140/tcp
ENTRYPOINT [ "/bin/bash", "/bin/docker-entrypoint.sh" ]
