FROM jupyterhub/jupyterhub:4.0

RUN apt-get update && apt-get -y upgrade && apt-get install --assume-yes vim git

RUN pip3 install notebook jupyterlab jupyterlab-git jupyter_scheduler jupyter-collaboration ipywidgets nbconvert

RUN adduser --gecos "" --disabled-password test && echo "test:test" | chpasswd

CMD ["jupyterhub"]