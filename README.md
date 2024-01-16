# Base Images ![GitHub Tag](https://img.shields.io/github/v/tag/scc365/base-images?display_name=tag&label=%20&sort=semver) ![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/scc365/base-images/release.yml?label=%20)



To complete SCC365 tasks, you will need to use a set of tools you are unlikely
to have installed on your own devices already. Provided you are using a
UNIX-like system and have Docker installed, you should be able to use the images
found here to install and run the software.

For specific information as to how to use each image, see the README files in
the given directories.

## Images

 - Mininet: [here](./mininet/)
 - Ryu: [here](./ryu/)

## Versioning

All the base images will share the same versioning as one another. This can be
leveraged to make life a little easier. Users should expect that any base images
of the same version are compatible with one another.

For the sake of course management, base image versions correspond to tags in
this repository, although tags are given metadata in the semver version to
provide the relevant year they were designed for (e.g. `v1.1.1+2024` when the
image is intended for use in 2024).

The general format for the images is: `ghcr.io/scc365/<baseimage>:v<version>`.

Also, a `latest` tag is provided where images tagged with `latest` are equal to
the images tagged with the highest semver version.

---

## License

The license for this base images repository is the do what the fuck you want to
public license. This reflects the license only for the files directly contained
in this repository and not the content that is pulled in during the build
process. 
