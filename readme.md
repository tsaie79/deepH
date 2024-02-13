# How to run this docker image

```bash
docker run -v /workspaces/deepH/test/:/home/test  -it --rm deeph-preprocess main /home/test
```
where /workspaces/deepH/test/ is the path to the folder containing the input files `openmx.out` and `openmx.scfout`.

