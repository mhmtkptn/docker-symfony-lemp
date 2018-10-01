#!/bin/bash

function runServices() {

    service php5.6-fpm start &
    nginx -g "daemon off;"
}

runServices