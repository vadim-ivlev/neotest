#!/bin/bash

dc exec neo bash -c 'cat /scripts/load-http-csv.cypher | cypher-shell'
