FROM binsec/binsec:latest
ARG NUM_PROCESSORS=8

USER root

ARG DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update   && \
    apt-get install -y --no-install-recommends opam graphviz sudo  \
        bzip2 libc6-dbg gcc g++ texinfo m4 wget xz-utils  python3  \
        git make wget build-essential libssl-dev gpg-agent  \
        libffi-dev python3-pip pipx cmake flex bison software-properties-common \
        zlib1g-dev p7zip pkg-config gdb z3 libgmp3-dev time unzip

# Import toolchain
WORKDIR /import
COPY 2025-08-25-butils.zip .
COPY toolchain.patch .
COPY toolchain.zip .
RUN unzip 2025-08-25-butils.zip && \
    unzip toolchain.zip && \
    rm -rvf 2025-08-25-butils.zip toolchain.zip

# Install binsecutils
WORKDIR /import/binsecutils
RUN pipx install .

# Patch toolchain
ENV PQDSSDIR=/import/toolchain
WORKDIR $PQDSSDIR
RUN patch -p1 -i ../toolchain.patch && \
    rm -rvf ../toolchain.patch

# Install valgrind.
RUN cp -r pqdss-toolchain/ct-tools/valgrind /tmp/valgrind
RUN chmod u+x /tmp/valgrind/install.sh && \
    /tmp/valgrind/install.sh           && \
    rm -r /tmp/valgrind

# Install timecop.
RUN cp -r pqdss-toolchain/ct-tools/timecop /tmp/timecop
RUN chmod u+x /tmp/timecop/install.sh && \
    /tmp/timecop/install.sh           && \
    rm -r /tmp/timecop

# Install dudect.
RUN cp -r pqdss-toolchain/ct-tools/dudect /tmp/dudect
RUN chmod u+x /tmp/dudect/install.sh && \
    /tmp/dudect/install.sh           && \
    rm -r /tmp/dudect

# Copy cycle.h into /usr/include.
RUN cp -r pqdss-toolchain/benchmarks /tmp/benchmarks
RUN chmod u+x /tmp/benchmarks/install.sh && \
    /tmp/benchmarks/install.sh           && \
    rm -r /tmp/benchmarks

# Final Setup
ENV PATH="/usr/share/valgrind/bin:/root/.local/bin:$PATH"
ENTRYPOINT ["bash"]
