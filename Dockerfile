FROM jupyterhub/jupyterhub:4.0

RUN apt-get update && apt-get -y upgrade && apt-get install --assume-yes vim git r-base r-base-dev libkrb5-dev python3-dev

# install the latest npm version correctly
RUN npm install -g n && n stable

RUN pip3 install notebook jupyterlab jupyterlab-git jupyter_scheduler jupyter-collaboration ipywidgets nbconvert sparkmagic

# Install R kernel and enable it to be used in Jupyter
RUN Rscript -e 'install.packages("IRkernel", repos=c("cran.priv","https://cloud.r-project.org"))' && Rscript -e 'IRkernel::installspec(user = FALSE)'

RUN adduser --gecos "" --disabled-password test && echo "test:test" | chpasswd

RUN jupyter labextension install "@jupyter-widgets/jupyterlab-manager"

CMD ["jupyterhub"]
