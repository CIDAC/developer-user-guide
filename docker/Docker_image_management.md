# Image Management

This section describes some commands that allows to manage and use docker images.

* To run docker builds execute:

        $ docker image build -t <image name> .

  > Note:
  >* The -t command allows to tag the build giving a name to the image
  >* Replace **image name** with name that you want to give to the tagged image.
  >* The **.** (dot) in the command line tells docker to build the image in the directory where the build is happening. 

*  To lists all images execute:

        $ docker image ls

* To show the history of the image execute:
    
        $ docker image history <image name>

  >Note:
  >* Replace **image name** with the image name that you want see the history.

* To return JSON metadata about the image execute:
  
        $docker image inspect <image name>

  >Note:
  >* Replace **image name** with the image name that you want to inspect.

* To pull an image or a repository from a registry execute:

        $ docker pull <image name>
  >Note:
  > * Replace **image name** with the image name that you want to pull from the repository.
