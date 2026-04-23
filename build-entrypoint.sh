#!/usr/bin/env bash


set -euo pipefail

apache2-foreground &
APACHE_PID = $!

sleep 2

echo "I build it" > /built.txt

kill $APACHE_PID
wait $APACHE_PID 2>/dev/null || true

echo "Build complete, apache shut down"
