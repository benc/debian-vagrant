#!/bin/bash
exec serf agent -tag role=ghost \
           -event-handler="member-join=/usr/local/bin/serf_member_join.sh" \
           -event-handler="member-leave,member-failed=/usr/local/bin/serf_member_leave.sh"
