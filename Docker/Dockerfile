FROM continuumio/miniconda3

COPY . /build_context
WORKDIR /opt

ENV TZ Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
	    sudo \
	    vim

# Use conda to install MFA
RUN useradd -ms /bin/bash sho && \
	    su - sho

WORKDIR /work

CMD ["bash"]
