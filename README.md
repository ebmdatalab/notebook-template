## What is the issue?

We all use python packages, such as Pandas, in our work at EBM DataLab. These packages are usually maintained by a small number of contributors online and occasionally they need to be updated. When this happens code that relies on the old version of the package can become non-functional and cause your jupyter notebook to throw an error. It is therefore a good idea to make note of the version of the package you are using, such as: 

```pandas==0.24.1' ```

```numpy==1.16.3```

This allows you to specify that your code uses this particular version of a package. 

## Doesn't this mean that you can have more than one version installed?

Usually no. You can have different version of some things installed (such as python 2 and python 3) but for the most part, installing a more up to date package will *update* an older version. 

## What's the solution?

This is a very common problem in coding and to get around this, something called virtual environments have been developed. 

Virtual enviroments are a named space in which you can install the languages and packages you require in isolation. You can create a virtual environment from the command line using venv (more here: href="https://realpython.com/python-virtual-environments-a-primer/"). Most people keep note of the packages they need by keeping a requirement.txt file which they use to populate their virtual environment with the correct packages. 

Unfortunately for us, simple virtual enviroments do not always work correctly when using Anaconda and Jupyter notebooks. This is because it is too easy to start Juptyer first and once yhe kernel is running, virtual environments are not easy to use. 

We have developed a solution using Docker. 

## What is Docker?

Docker is a tool that is designed to make it easier to create, deploy and run applications using something called Containers. Containers are an isolated space in which packages, code and anything else you might need are wrapped up and shipped as one block. This container can then be shared and will work on any other Linux machine regardless of any customised settings on any particularly machine. 

Docker is similar to something that has been used for a long time called Virtual Machines. The advantage over a Virtual Machine is that instead of creating a whole virtual operating system, it allows whatever to be shipped to use the Linux on the machne to run which gives better performance. 

## Why do we like Docker?

* Open Source

### Instructions

You need to download Docker Desktop for your machine (windows/mac) and make a user account. Once you have this installed, you will need to log in. 

You can then download either by the download button or by git clone this repo to get the files you need. 

The folder you download will contain this structure:

    .
    ├── config                    
    │   ├── docker-compose.yml              
    │   ├── Dockerfile
    │   └── requirements.txt
    ├── data
    ├── notebooks 
    └── run.sh

We need 3 files to work:
1. Dockerfile - this contains the instructions that Docker uses to create a container. It needs a basic version of an image. 
2. requirements.txt - this contains all the packages and the versions that you want to use with this notebook
3. docker-compose.yml - this tell Docker how to maintain the docker container for example how to save files 

In order to run the docker container you can run the bash script called run.sh. 

```bash sh run.sh ```
