FROM ubuntu:22.04

WORKDIR /workspace

RUN apt update && apt install -y clang cmake git

RUN git clone https://github.com/justinmeza/doge.git

WORKDIR /workspace/doge/build

RUN cmake ..

RUN make

RUN ln -s $PWD/doge /bin/doge

WORKDIR /code

COPY bin .

CMD "./run.sh"