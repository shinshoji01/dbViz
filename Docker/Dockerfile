FROM continuumio/miniconda3

COPY . /build_context
WORKDIR /opt

ENV TZ Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN useradd -ms /bin/bash sho && \
	    su - sho

WORKDIR /work

CMD ["bash"]
