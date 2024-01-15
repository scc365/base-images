# Mininet Base Image

This dir contains the means to build a base image for containers needing
Mininet. 

Since there are many ways of running Mininet, this image simply starts a bash
shell (along with the Open vSwitch service). The specific commands needed to run
other executables should be provided as arguments to any `docker run` commands.
Some common examples are given below.

> 💡 **Remember:** When giving arguments for file paths/names the paths are
> always referring to the container's filesystem. By default, the container's
> current working dir at start is `/workspace`, so relative file paths will be
> relative to that directory.

## Running a Topology (via Python API)

```bash
docker run --rm -it --privileged \
  -v "$(pwd)"/topology.py:/workspace/topology.py:ro \
  --label scc365=topology --name topology \
  ghcr.io/scc365/mininet:latest \
  python3 topology.py
```

## Running a Topology (via the `mn` tool)

```bash
docker run --rm -it --privileged \
  -v "$(pwd)"/topology.py:/workspace/topology.py:ro \
  --label scc365=topology --name topology-mn \
  ghcr.io/scc365/mininet:latest \
  mn --custom topology.py --topo example
```

## Using the `controller` Tool

```bash
docker run --rm -it --privileged \
  --label scc365=ptcp --name ptcp \
  ghcr.io/scc365/mininet:latest \
  controller ptcp:6633
```

---

## Using `ovs-ofctl` and `ovs-vsctl` Commands

If you just want to run one of the commands in an empty environment, you can like
so:

```bash
docker run --rm -it --privileged \
  --label scc365=ovs-vsctl --name vsctl \
  ghcr.io/scc365/mininet:latest \
  ovs-vsctl --help
```

However, it is more likely that you will want to run the command in a container
where a topology is already running. Provided you know the name of the container
with the topology already running in, that can be done like:

```bash
docker exec -it topology ovs-vsctl --help
```

> 💡 **Check:** Replace the `topology` bit in this command with the name of the
> container that is running the topology.

## Getting a new Shell

Likewise, if you want to execute any command within a container that is running
a topology (and you know the name of the container), you can get a fresh bash
shell like so:

```bash
docker exec -it topology bash
```
