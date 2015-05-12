# Minimal Docker container for a Go app

Using static linking to create a minimal container (under 5MB) for an app.

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
unindented/dummy    latest              0842c186c72e        5 minutes ago       4.851 MB
ubuntu              latest              07f8e8c5e660        11 days ago         188.3 MB
```


## Installing

If you don't have [Go](https://golang.org/) installed, you can just use [Homebrew](http://brew.sh/):

```
$ brew install go --with-cc-common
```

Same with [Docker](https://www.docker.com/):

```
$ brew cask install docker
```


## Building

To generate the statically linked binary for the app, ready to run on Linux, just do:

```
$ make
```


## Running

If you want to build the container with the app:

```
$ docker build -t unindented/dummy .
```

Then you can run the container with:

```
$ JOB=$(docker run -d -P unindented/dummy)
```

Now you can `curl` the app to see if everything is working:

```
$ PORT=$(docker port $JOB 80 | awk -F: '{ print $2 }')
$ curl http://localhost:$PORT
```

Once you are done, you can stop the container:

```
$ docker stop $JOB
```
