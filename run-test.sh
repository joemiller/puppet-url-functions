#!/bin/sh

mydir=$(dirname $0)

export RUBYLIB=$RUBYLIB:$mydir/lib/
export RUBYLIB=$RUBYLIB:$mydir/lib/puppet/parser/functions/

for test in $(ls test-*.pp); do
    echo "=> Running test: $test"
    puppet apply --modulepath=$mydir --verbose --config $mydir/puppet.conf $test
done
