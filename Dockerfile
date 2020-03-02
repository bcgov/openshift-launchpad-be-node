FROM mhart/alpine-node:12
ARG APP_ROOT=/opt/app-root/src
ENV NO_UPDATE_NOTIFIER=true
WORKDIR ${APP_ROOT}
COPY . .
RUN npm ci
EXPOSE 8000
CMD ["npm", "run", "start"]
