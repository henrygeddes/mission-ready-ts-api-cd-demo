FROM node:21.7.1 AS mission-ready

WORKDIR /mission-ready
COPY . .

RUN npm install
RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
ENTRYPOINT ["npm", "run", "start"]