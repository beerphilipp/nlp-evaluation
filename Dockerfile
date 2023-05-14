FROM jupyter/datascience-notebook:2023-05-01
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
COPY . .
CMD ["jupyter","notebook", "--ip='*'", "--NotebookApp.token=''", "--NotebookApp.password=''"]