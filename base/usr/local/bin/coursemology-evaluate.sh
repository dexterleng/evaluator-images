#!/bin/bash 
sigterm_handler() { 
  kill -TERM "$child" 2>/dev/null
}

trap sigterm_handler SIGTERM

show_help() {
  cat << EOF
Usage: ${0##*/} [-h?] [-mMEMORY_LIMIT] [-cCPU_TIME_LIMIT]
Prepares, compiles, and executes the submission in the /home/coursemology/package directory.

     -h?         Display this help message and exit
     -m          Memory limit, in kilobytes, or unlimited for no limit.
     -c          CPU time limit, in seconds, or unlimited for no limit.
EOF
}

# Parse command line arguments
OPTIND=1
memory_limit='unlimited'
cpu_time_limit='unlimited'

while getopts "h?m:c:" opt; do
  case "$opt" in
  h|\?)
    show_help
    exit 0
    ;;
  m)
    memory_limit=$OPTARG
    ;;
  c)
    cpu_time_limit=$OPTARG
    ;;
  esac
done

mkdir -p /home/coursemology/package
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

# Apply process memory and CPU time limits, applies to each target
ulimit -v $memory_limit -t $cpu_time_limit
ulimit -a

test_types=('public' 'private' 'evaluation')
return_codes=0

for test_type in "${test_types[@]}"
do
  regex='^'$test_type':'
  cat Makefile | grep $regex
  if [ $? -eq 0 ]; then
    gosu coursemology make $test_type &
    child=$!
    wait "$child"
    return_code=$?
    return_codes="$((return_codes + return_code))"
    if [ -s report.xml ]; then
      mv report.xml report-$test_type.xml
    fi
  fi
done

# Backward compatibility with Makefiles with just the test target.
cat Makefile | grep '^test:'
if [ $? -eq 0 ]; then
  gosu coursemology make test &
  child=$!
  wait "$child"
  return_code=$?; if [[ $return_code != 0 ]]; then exit $return_code; fi
fi

if [ "$return_codes" -ne 0 ]; then
  exit 2
fi
exit 0
