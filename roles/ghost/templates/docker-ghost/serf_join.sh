#!/bin/bash
exec serf join $SERF_PORT_7946_TCP_ADDR:$SERF_PORT_7946_TCP_PORT

# poc! this prolly should go into a serf event handler
export POSTGRES_HOST=$(serf members -tag role=postgres | awk {'print $2'} | cut -d':' -f1)
