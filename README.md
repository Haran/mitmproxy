## Why

Original build of MITMProxy is built on top of GLIBC with version, that is higher than GLIBC available in CentOS. So pre-compiled binaries, that can be downloaded from https://mitmproxy.org/downloads/ will not work in CentOS 7. Developer(s) officially refused to support older version of GLIBC ([issue link](https://github.com/mitmproxy/mitmproxy/issues/3533#issuecomment-640811676)).

## What

One does not simply upgrade GLIBC in the system; so the most elegant solution would be to recompile MITMProxy from sources in the system, that it will be run in - CentOS 7.8 in our case.

> CentOS 8 has GLIBC upgraded and this workaround will become irrelevant when we upgrade OS on our live hosts and therefore our local enviroments.

The idea is straightforward - the local VM with CentOS 7 is created, sources are downloaded, build instructions overriden, binaries compiled and downloaded from VM to host machine.

## How

```
vagrant up
```
This will power on the virtual machine, create necessary folders locally, run provisioning, and retrieve compiled files from VM to the host if everything goes smoothly.

```
vagrant destroy
```
After the previous process succeeds in order to keep your local VMs clean from unnecessary instances.
