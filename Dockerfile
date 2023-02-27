FROM node:latest
WORKDIR /user/share/app/test
ADD ./nodeapp/* /user/share/app/test/
RUN npm install
EXPOSE 3000
CMD [ "npm","start" ]
