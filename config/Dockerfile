FROM leandatascience/jupyterlab-ds:latest

RUN useradd -m app

ENV MAIN_PATH=/home/app/notebook

# The following environment variables are used by the run_jupyter.sh
# script (q.v.)

# This is put at the start of `sys.path`; `libs/` is supposed to
# include any user-provided libraries, so they can be imported
ENV LIBS_PATH=${MAIN_PATH}/libs

# The location of jupyter_notebook_config.py, which is copied to
# ~/.jupyter/
ENV CONFIG_PATH=${MAIN_PATH}/config

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

EXPOSE 8888

CMD cd ${MAIN_PATH} && sh config/run_jupyter.sh
USER app
