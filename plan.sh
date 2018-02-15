#!/bin/sh
#
 
# default return code is 0
rc=0
 
# This request will test whether our index page can be retrieved.
{{pkgPathFor "core/curl"}}/bin/curl -sS --head --fail --max-time 1 http://localhost:{{cfg.app.port}}/
 
case $? in
    # Zero exit status means curl got back a 200 end everything is ok.
    0)
        rc=0 ;;
    # Anything else is critical.
    *)
        rc=2 ;;
esac
 
exit $rc
