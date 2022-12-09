# Nuxt JS - Auth0 Demo

## Introduction
This project is a small demo application that sets up a NuxtJS (v2) application with Auth0.
The authentication library used for this purpose is [nuxt/auth](https://auth.nuxtjs.org/).

The purpose of this demo application is to show how to set-up Auth0 support for a NuxtJS application with Docker support.

## Project structure
There are two pages available.
1. The homepage (index) simply contains a title and a link to log in.
2. An `/authenticated` page is available on the logged-in users.

## How to run
### Prerequisites
Make sure you have an Auth0 account with a working tenant that supports a Single Page Application.
Additionally, this project uses the PKCE flow for improved security. Make sure your Auth0 application supports the PKCE flow.

### Docker
This projects has support for Docker Compose.
1. Go to the Docker Compose file (`~/docker-compose.yml`) and replace the build arguments in the file with your Auth0 data
2. Run `docker-compose up`

### Local installation
1. Copy the `.env.example` file and rename it to `.env`
2. Change the Auth0 example values to the values from your Auth0 application
3. Run `yarn install`
4. Run `yarn dev` or `yarn build`/`yarn start`