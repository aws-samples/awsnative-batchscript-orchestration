// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

FROM oraclelinux:8-slim
RUN microdnf install oracle-instantclient-release-el8 && \
    microdnf install oracle-instantclient-basic oracle-instantclient-devel oracle-instantclient-sqlplus   && \
    microdnf clean all  
RUN dnf -y install python3
RUN curl -O https://bootstrap.pypa.io/pip/3.6/get-pip.py
RUN python3 get-pip.py
RUN pip install awscli
RUN dnf -y install which
RUN microdnf clean all
CMD ["sqlplus", "-v"]     
ADD fetch_and_run_s3script.sh /usr/local/bin/fetch_and_run_s3script.sh
RUN chmod 755 /usr/local/bin/fetch_and_run_s3script.sh
WORKDIR /tmp
USER nobody
ENTRYPOINT ["/usr/local/bin/fetch_and_run_s3script.sh"]