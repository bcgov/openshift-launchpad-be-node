# Openshift Launchpad Backend Node

This node.js app implements a minimal API endpoint with Keycloak protected endpoints.

## Design Rationale

This is designed as a minimally viable full-stack application which can self-host a static frontend. This was purposely designed with as few dependencies as possible with a minimal amount of opinionation on design.

### Application

The application is a simple express application, with some basic support for HTTP issue codes through the `api-problem` package. It uses express routers to construct and mount the subpaths of the application. The API endpoint is mounted on the `/api` path, while the frontend is mounted on the `/app` path. The application will look for frontend static files in the `/frontend/dist` directory.

#### Application Components

The application has the following component dependencies:

* api-problem
* body-parser
* compression
* express
* keycloak=connect
* morgan
* npmlog

#### Code Organization

The app splits itself into routes and components, where routes handle network traffic, and components handle business logic. The demo `/api/v1/hello` endpoint is an authenticated keycloak protected endpoint to demonstrate the use of the keycloak-connect middleware. If there is a static frontend being hosted, it will appear under the `/app` path and should contain the resources needed for the frontend to render on the browser.

## Configuration

This application will require some configuration. The API will be locked down and require a valid JWT Token to access. We will need to configure the application to authenticate using the same Keycloak realm as its associated frontend.

## Super Quickstart

In [src/components/keycloak.js](src/components/keycloak.js), replace `YOURCLIENTHERE`, `YOURREALMHERE` and `YOURAUTHURLHERE` with the appropriate application values.

``` sh
npm install
npm run start
```

### Run tests

``` sh
npm run test
```

### Lints and fixes files

``` sh
npm run lint
npm run lint:fix
```
