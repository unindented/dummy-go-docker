FROM       scratch
MAINTAINER Daniel Perez Alvarez <unindented@gmail.com>
ADD        dummy /dummy
ENV        PORT 80
EXPOSE     80
ENTRYPOINT ["/dummy"]
