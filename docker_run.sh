#!/bin/bash
yarn install && ./node_modules/cypress/bin/cypress install && yarn test:prod
