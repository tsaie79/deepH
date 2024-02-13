# How to run this docker image

```bash
docker run -v /dir/to/openmx/outputs:/some/path  -it --rm tsaie79/deeph-preprocess main /some/path
```
where,
1. ` /dir/to/openmx/outputs` is the path to the folder containing the input files `openmx.out` and `openmx.scfout`. 
2. `/some/path` is the internal path in the docker container where the input files are copied to. This should be set but not explicitly used by the user.

