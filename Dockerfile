# pawanprjl/python-nginx:alpine is merge of official python and nginx images.
FROM pawanprjl/python-nginx

ENV PIP_ROOT_USER_ACTION ignore
ENV PIP_DISABLE_PIP_VERSION_CHECK 1


#HEALTHCHECK --interval=10s --timeout=2s --start-period=10s --retries=3 CMD pgrep nginx && pgrep python3 >> /dev/null || exit 1

WORKDIR /app

# copy project
COPY . .

# install requirements
RUN pip install -r requirements.txt

# symlink docker-entrypoint.sh at root path
RUN ln -s /app/docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 80

CMD ["sh", "-e", "/docker-entrypoint.sh"]
