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
return_code=$?; if [[ $return_code != 0 ]]; then exit $return_code; fi

gosu coursemology make compile &
child=$! 
wait "$child"
return_code=$?; if [[ $return_code != 0 ]]; then exit $return_code; fi

# TODO: Process constraints
gosu coursemology make test &
child=$! 
wait "$child"
return_code=$?; if [[ $return_code != 0 ]]; then exit $return_code; fi
