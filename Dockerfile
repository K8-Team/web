FROM node:18
WORKDIR /usr/src/app
COPY package.json .
RUN nmp install 
COPY . . 
ENV PORT=3000 \
    API_HOST=http://ip_vm_with_api:3001

EXPOSE 3000
CMD ["nmp","start"]
