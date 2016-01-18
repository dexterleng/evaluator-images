#!/bin/bash 
sigterm_handler() { 
  kill -TERM "$child" 2>/dev/null
}

trap sigterm_handler SIGTERM

mkdir /home/coursemology/package
cd /home/coursemology/package
chown -R coursemology:coursemology .

make prepare &
child=$! 
wait "$child"

gosu coursemology make compile &
child=$! 
wait "$child"

# TODO: Process constraints
gosu coursemology make test &
child=$! 
wait "$child"
