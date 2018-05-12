FROM mhart/alpine-node:8.11.1

# install nodemon
RUN yarn global add nodemon

# 현재 디렉토리의 package.json 을 컨테이너의 tmp 폴더 아래에 복사.
COPY ./package.json /tmp/package.json

# 필요한 모듈 install.
RUN cd /tmp && yarn install

# 프로젝트 코드가 위치할 app 폴더를 만들고 node_modules 복사.
RUN mkdir -p /usr/src/app && cp -a /tmp/node_modules /usr/src/app

WORKDIR /usr/src/app
COPY ./.babelrc /usr/src/app
COPY ./package.json /usr/src/app
COPY ./src/ /usr/src/app/

CMD [ "yarn", "start" ]