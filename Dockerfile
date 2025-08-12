FROM node:22

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm prune --omit-dev

EXPOSE 5173

RUN useradd -m containeruser
USER containeruser

CMD [ "npm","run","dev","--","host"]