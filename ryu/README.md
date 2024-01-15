# Ryu SDN Controller

> ⚠️ Since the upstream is no longer actively maintained, the version numbers
> are unlikely to see any change here. Importantly, this means that Ryu will be
> run **using Python 3.9**!

Ryu is a well documented Python-based OpenFlow SDN controller framework.

> 💡 **Remember:** When giving arguments for file paths/names the paths are
> always referring to the container's filesystem. By default, the container's
> current working dir at start is `/workspace`, so relative file paths will be
> relative to that directory.

## Running a Controller

```bash
docker run --rm -it -p 6633:6633/tcp  \
  -v "$(pwd)"/controller.py:/workspace/controller.py:ro \
  --label scc365=controller --name controller \
  ghcr.io/scc365/ryu:latest \
  --ofp-tcp-listen-port 6633 --verbose controller.py
```
