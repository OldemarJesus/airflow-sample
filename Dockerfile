FROM apache/airflow:2.9.0-python3.9
USER root

# INSTALL VIM INTO AIRLOW IMAGE
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         vim \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER airflow

COPY requirements.txt /
COPY assets/Office365_REST_Python_Client-2.5.8-py3-none-any.whl /

WORKDIR / 

RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r requirements.txt
