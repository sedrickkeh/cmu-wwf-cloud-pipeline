# cmu-wwf-cloud-pipeline

## Quickstart
Once access has been granted, it should be enough to run 
```bash
bash pipeline.sh
```
Within that bash file, there are some variables that you may need to change. See `pipeline.sh` for more details.


To login manually:
```bash
ssh -i ~/.ssh/(path-to-private-key) (username)@(cloud-server-address)
```
Here, `username` should not change, while a new `cloud-server-address` is generated whenever the server is reset.


