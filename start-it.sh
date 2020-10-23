#!/bin/bash
set -e
set -m

if [ "$1" = '' ]

then
  rm environment.html 
  sbcl --load "quicklisp/setup.lisp" --load "actr7.x/load-act-r.lisp" --eval '(progn (init-des) (echo-act-r-output) (mp-print-versions) (run-node-env))'

else 
  mv environment.html actr7.x/examples/connections/nodejs/
  sbcl --non-interactive --load "quicklisp/setup.lisp" --load "actr7.x/load-act-r.lisp" --eval '(progn (init-des) (run-node-env) (loop))' > /dev/null 2>&1 &
  exec "$@"

fi
