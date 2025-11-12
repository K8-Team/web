FROM node:18 AS builder
WORKDIR /usr/src/app
COPY package.json .
RUN npm install 
COPY . . 

# Multi-stage build
FROM node:18-alpine
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
ENV PORT=3000 \
    API_HOST=""
EXPOSE 3000
# USER node
CMD ["npm","start"]