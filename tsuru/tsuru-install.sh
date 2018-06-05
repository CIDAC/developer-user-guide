
echo "Enter the latest version of golang:"
read goversion

if test -f ./go$goversion.linux-amd64.tar.gz; then
  echo "This version is already downloaded."
else
  wget https://dl.google.com/go/go$goversion.linux-amd64.tar.gz
fi

if test -d /usr/local/go; then
  echo "Golang is already installed in /usr/local/go."
else
  echo "Unpacking golang to /usr/local/go."
  sudo tar -C /usr/local -xzf ./go$goversion.linux-amd64.tar.gz

  echo "Exporting the golang path."
  export PATH=$PATH:/usr/local/go/bin
  mkdir ~/go
  export GOPATH=$HOME/go
fi

echo "Removing the download package."
  rm ./go$goversion.linux-amd64.tar.gz

echo "Installing Tsuru by golang."
go get github.com/tsuru/tsuru-client/tsuru
