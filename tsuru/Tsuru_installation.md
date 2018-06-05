# Installing tsuru client and accessing Tsuru from your computer

**tsuru** is the command line utility used by application developers, that will allow users to create, list, bind and manage apps.

The following links describes how you can install tsuru CLI, using pre-compiled binaries, packages or building them from source:

* [https://docs.tsuru.io/stable/using/install-client.html](https://docs.tsuru.io/stable/using/install-client.html)
* [http://tsuru-client.readthedocs.io/en/latest/installing.html?highlight=client#using-the-ppa-ubuntu-only](http://tsuru-client.readthedocs.io/en/latest/installing.html?highlight=client#using-the-ppa-ubuntu-only)

> Note:
> * If you want a easier way to install tsuru, a script was provided to help in the installation process.
> * The script require be set execution privilleges to run, you can set that privilleges by running:
```bash
sudo chmod +x ./tsuru-install.sh
```
> * After initialize the installation script, he will ask by the latest golang version, because the script will download and install golang to install tsuru.
> * The actual version of golang, when this text is being written, is 1.10.2, to see the actual version go to [golang project](https://golang.org/project/)
> * The script may require the sudo password to work properly.
> * In case of failure, you need to export this two paths in order to complete the installation process:
```bash
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
```
