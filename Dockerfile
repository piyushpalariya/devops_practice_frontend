FROM node:22-slim

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm prune --omit-dev

EXPOSE 5173

RUN useradd -m containeruser
USER containeruser
RUN chown -R containeruser /app

CMD [ "npm","run","dev","--","host"]