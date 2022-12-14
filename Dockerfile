# The builder stage
# This stage is responsible for:
# 1. Installing the necessary dependencies
# 2. Building the NuxtJS application
# 3. Bundling the necessary external packages into a standalone build
FROM node:16-alpine as builder
# Use Docker Buildkit for faster build times (https://docs.docker.com/build/buildkit/)
ENV DOCKER_BUILDKIT=1

# Set up build arguments
ARG AUTH0_CLIENTID
ENV AUTH0_CLIENTID=${AUTH0_CLIENTID}

ARG AUTH0_DOMAIN
ENV AUTH0_DOMAIN=${AUTH0_DOMAIN}

ARG AUTH0_AUDIENCE
ENV AUTH0_AUDIENCE=${AUTH0_AUDIENCE}

# Create a place in the container to process the NuxtJS application in
WORKDIR /app
# Copy all the files (excluding those defined in the .dockerignore file)
COPY . .

# Build the NuxtJS application, including devDependencies and create a production build
RUN yarn install --frozen-lockfile && \
npx nuxt build

# Build the NuxtJS application in production mode
RUN rm -rf node_modules && \
yarn install --ignore-scripts --production

# The runner stage
# This is the final image that will be used when running the Docker container
# It's responsible for:
# 1. Copying the necessary custom runtime files to the container
# 2. Copying the NuxtJS configuration
# 3. Copying the entire NuxtJS application (the .nuxt and the static folders)
# 4. Setting container variables
# 5. Defining the start-up command
FROM node:16-alpine as runner
# Since this is the final image, we want to build in production mode
ENV NODE_ENV=PRODUCTION

# Create a separate folder for the application to live in
WORKDIR /app

# Copy the NPM modules
COPY --from=builder /app/node_modules ./node_modules

# Copy the NuxtJS configuration for start-up and runtime configuration settings from the builder
COPY --from=builder /app/nuxt.config.js ./nuxt.config.js

# Copy the entire NuxtJS application from the builder
COPY --from=builder /app/.nuxt ./.nuxt
COPY --from=builder /app/static ./static

# Expose port 3000 for the docker containers
EXPOSE 3000

# Set NuxtJS system variables so the application can be reached on your network
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

# The NuxtJS start-up command when the container is launched to serve the built application
CMD [ "npx", "nuxt-start" ]