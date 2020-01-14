This is a skeleton project for creating a reproducible, cross-platform
analysis notebook, using Docker.  It also includes:

* configuration for `jupytext`, to support easier code review
* cross-platform startup scripts
* best practice folder structure and documentation

# How to get started

This repo is the template to use with future projects that utilise Docker. Follow these steps to create a new repo for your project with the template provided here. 

## Set Up
### With Command Line 

1. On the command line, navigate to where you keep your work 
2. Clone this repo using the command: ```git clone https://github.com/ebmdatalab/custom-docker.git```
3. Create your new repo on the EBM Datalab github. It is a good idea to include a .gitignore and license at this stage. 
4. Clone this repo onto your machine using git clone. 
5. Copy the files from the custom-docker git folder (made in step 2) across into your new project git repo
6. Delete the custom-docker repo
7. Add all your files to git using ```git add . ``` and ```git commit -m "first commit"```

### With Github Desktop 
1. Clone the custom-docker repo 
2. Create a new repo for your project. Use git ignore and license. 
3. Navigate back to custom-docker repo on the Github app and press View the files of your repo. 
4. Copy the files from the custom-docker git folder (made in step 2) across into your new project
5. Delete the custom-docker repo in the Github app
6. Navigate back to your project repo and commit to master

# Folder layout

By convention, all Jupyter notebooks live in `notebooks/`.  When
notebooks look like they will contain more than a few lines of Python,
the Python is separated into a separate module, in `lib/`, and
imported from the notebook.

`config/` contains the configuration required to run the Notebook; you
shouldn't have to touch this.

# Developing notebooks

There are two ways of getting started with a development environment:
with Docker, or using Python virtual environments.

Docker allows you to run identical software on all platforms. In
Windows, in particular, there are challenges ensuring all python
packages are exactly the same as those available on other platforms.

## Docker enviroment
### Installation

Follow installation instructions
[here](https://docs.docker.com/install/). If running on Windows, you
may find it useful first to refer to our own installation notes
[here](https://github.com/ebmdatalab/custom-docker/issues/4).

Windows users who log into an Active Directory domain (i.e. a network
login) may find they lack permissions to start Docker correctly. If
so, follow [these
instructions](https://github.com/docker/for-win/issues/785#issuecomment-344805180).### Start notebook

The first time you do this, it may take some time, as the (large) base
Docker image must be downloaded. On Linux or OS X:

    ./run.sh

On Windows, double-click `run.bat`.

This will start a Jupyter Lab server in a Docker container. You will
be able to access this in your web browser at http://localhost:8888/.
Changes made in the Docker container will appear in your own
filesystem, and can be committed as usual.

## Running without Docker

If you want to execute notebooks without Docker, set up a [virtual
environment](https://docs.python.org/3/tutorial/venv.html) for the
Python version in question (you can infer this from the first line of
the `Dockerfile` in the root of this repo).

Next, install dependencies that are normally automatically included by
Docker:

    pip install jupyter jupytext pip-tools

...and install this notebook's dependencies:

    pip install -r requirements.txt

Finally, run jupyter in the same way it's started in the Docker image:

    PYTHONPATH=$(pwd) jupyter notebook --config=config/jupyter_notebook_config.py

# Development best practices
## Installing new packages

Best practice is to ensure all your python dependencies are pinned to
specific versions. To ensure this, while still supporting upgrading
individual packages in a sane way, we use
[pip-tools](https://github.com/jazzband/pip-tools).

The workflow is:

* When you want to install a new package, add it to `requirements.in`
* Run `pip-compile` to generate a `requirements.txt` based on that file
* Run `pip install -r requirements.txt`
* Commit both `requirements.in` and `requirements.txt` to your git repo

To *upgrade* a specific package:

    pip-compile --upgrade-package <packagename>

To upgrade everything:

    pip-compile --upgrade

Don't forget to run `pip install -r requirements.txt` after running any upgrade command.

To execute these within your dockerised environment, start a new Bash
console in Jupyter Lab (from the same menu you would create a new
notebook).

You can then run whatever shell commands you like, by typing them and
hitting Shift + Enter to execute.

# Complete the readme
This should contain all the information about your project

### Add a Binder button
Binder allows you to view *and interact* with any notebooks within the `notebooks/` folder. This will only work on public repos. 

Any changes you make there won't be saved; to do development work, you'll need to set up a local jupyter server and git repository.

Use the browser to go to [Binder](https://mybinder.org). Copy and paste in the github address of your notebook and copy the output link. This should be added to your readme. 

### nbviewer 
Notebooks live in the `notebooks/` folder (with an `ipynb` extension). You can most easily view them [on
nbviewer](https://nbviewer.jupyter.org/github/ebmdatalab/seb-docker-test/tree/master/notebooks/),
though looking at them in Github should also work.

### Instruction on how to cite 
Once a project is completed, please use the instructions [here](https://guides.github.com/activities/citable-code/) to deposit a copy of your code with Zenodo. You will need a Zenodo free account to do this. This creates a DOI. Once you have this please add this in the readme. 

If there is a paper associated with this code, please change the 'how to cite' section to the citation and DOI for the paper. This allows us to build up citation credit. 

## Jupytext and diffing

The Jupyter Lab server is packaged with Jupytext, which automatically
synchronises edits you make in a notebook with a pure-python version
in a subfolder at `notebooks/diffable_python`. This skeleton is also
set up with a `.gitattributes` file which means `ipynb` files are
ignored in Github Pull Requests, making it easier to do code reviews
against changes.

# Developing this skeleton

The base Docker image used by this Dockerfile can be found
[here](https://github.com/ebmdatalab/datalab-jupyter). If you need to
provide a new version of Python, or upgrade the base packages, that's
the place to do it.

You could also upgrade Python packages in the Dockerfile in this repo,
but users will benefit from faster startup times if you pre-install
them in a base image.

To Do 
* Think about pip dependencies and the base image
