#!/bin/bash 
sigterm_handler() { 
  kill -TERM "$child" 2>/dev/null
}

trap sigterm_handler SIGTERM

cd /home/coursemology/package
chown -R coursemology:coursemology .

gosu coursemology make prepare compile &
child=$! 
wait "$child"

# TODO: Process constraints
gosu coursemology make test &
child=$! 
wait "$child"
