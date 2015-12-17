# meccu.sh
A very small, bash-based framework for collecting metrics for graphite servers.  Meant to be used with older servers that lack the dependencies for running current versions of great tools like collectd, etc.

Right now meccu needs netcat and you should be all set!

## Getting Started.

* modify the meccu.sh with the graphite information you need.
* put any data collection scripts you want in the metrics directory, then:
    sh mecchu.sh
* et voila! It should start running the collection and sending to your graphite server ever INTERVAL seconds.

## TODO
Lots of stuff to do:
* add debug mode. Should be able to see sample data that meccu will send before starting.
* add more signal handling, making it easier to stop, restart, pause.
* add a lot more sample metrics. (will be on that soon)
