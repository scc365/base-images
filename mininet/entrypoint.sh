#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

function becho {
    echo -e "\033[1m$1\033[0m"
}

function start_openvswitch_service {
    becho "*** Starting OpenvSwitch service..."
    service openvswitch-switch start > /dev/null 2>&1
    ovs-vswitchd --pidfile --detach > /dev/null 2>&1
    ovs-vsctl set-manager ptcp:6640 > /dev/null 2>&1
    becho "*** OpenvSwitch service started ✅"
}

function stop_openvswitch_service {
    becho "*** Stopping OpenvSwitch service..."
    service openvswitch-switch stop > /dev/null 2>&1
    becho "*** OpenvSwitch service stopped ✅"
}

if ! start_openvswitch_service; then
    becho "*** Failed to start OpenvSwitch service ❌"
    exit 1
else
    trap "stop_openvswitch_service" EXIT
fi

becho "|-- SCC365: Mininet Docker Image 🐳 --|"
/bin/bash -c "$*"
