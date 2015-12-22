![meccu](https://www.dropbox.com/s/mmzy4pdl1vlum7m/meccu_small.png?dl=0)

# meccu.sh
Meccu is a very small, bash-based framework for collecting metrics for graphite servers. It is meant to be used with older servers that lack the dependencies for running current versions of great tools like collectd, etc.

Right now meccu needs netcat and you should be all set!

## Getting Started.

* modify the meccu.sh with the graphite information you need.
* put any data collection scripts you want in the metrics directory, then:
    sh mecchu.sh
* et voila! It should start running the collection and sending to your graphite server every `${INTERVAL}` seconds.

## TODO
Lots of stuff to do:
* add debug mode. Should be able to see sample data that meccu will send before starting.
* add more signal handling, making it easier to stop, restart, pause.
* add a lot more sample metrics. (will be on that soon)
