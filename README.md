This is a skeleton xproject for creating a reproducible, cross-platform
analysis notebook, using Docker.

To use, clone the repo, and copy the files to a new folder (minus the
`.git` subfolder).  Init this as a new git repo, push it to Github,
and start coding!

Replace this front matter with information about your project; you
should probably keep the rest of the contents to help other users of
this package.


## Quick start

You can view and interact with any notebooks in the `notebooks/`
folder by launching the notebook in the free online service,
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ebmdatalab/custom-docker/master).

Any changes you make there won't be saved; to do development work,
you'll need to set up a local jupyter server and git repository.

## Install Docker

Follow installation instructions
[here](https://docs.docker.com/install/). If running on Windows, you
may find it useful to fiirst refer to our own installation notes
[here](https://github.com/ebmdatalab/custom-docker/issues/4).

Windows users who log into an Active Directory domain (i.e. a network
login) may find they lack permissions to start Docker correctly. If
so, follow [these
instructions](https://github.com/docker/for-win/issues/785#issuecomment-344805180).

## Start notebook

On Linux or OS X:

    ./run.sh

On Windows, double-click `run.bat`.

This will start a Jupyter Lab server in a Docker container. You will
be able to access this in your web browser at http://localhost:8888/.
Changes made in the Docker container will appear in your own
filesystem, and can be committed as usual.

### Folder layout

By convention, all your notebooks should live in `notebooks/`.  If you
are writing more than a few lines of Python, break them out into a
separate module, which should live in `lib/`, and import it.

`config/` contains the configuration required to run the Notebook; you
shouldn't have to touch this.

### Installing new packages

Best practice is to ensure all your python dependencies are pinned to
specific versions. To ensure this, while still supporting upgrading
individual packages in a sane way, we use
[pip-tools](https://github.com/jazzband/pip-tools).

The workflow is:

* When you want to install a new package, add it to `requirements.in`
* Run `pip-compile` to turn this into a generated `requirements.txt` (which you should never edit directly)
* Run `pip-sync` to bring your environment in sync with this `requirements.txt`
* Commit both `requirements.in` and `requirements.txt` to your git repo

To *upgrade* a specific package:

    pip-compile --upgrade-package flask

To upgrade everything:

    pip-compile --upgrade

Don't forget to run `pip-sync` after running any upgrade command.

To execute these within your dockerised environment, start a new Bash
console in Jupyter Lab (from the same menu you would create a new
notebook).

You can then run whatever shell commands you like, by prepending a
`!`, and then hitting Shift + Enter to execute (for example,
`!pip-compile`)

### Jupytext and diffing

The Jupyter Lab server is packaged with Jupytext, which automatically
synchronises edits you make in a notebook with a pure-python version
in a subfolder at `notebooks/diffable_python`. This skeleton is also
set up with a `.gitattributes` file which means `ipynb` files are
ignored in Github Pull Requests, making it easier to do code reviews
against changes.


## Running without Docker

If you want to execute notebooks without Docker, set up a virtual
environment for the python version in question (you can infer this
from the first line of the `Dockerfile`).  Then install dependencies
that are normally automatically included by Docker:

    pip install jupyter jupytext pip-tools

Then install this notebook's dependencies:

    pip-sync

Now run jupyter in the same way it's started in the Docker image:

    PYTHONPATH=$(pwd) jupyter notebook --config=config/jupyter_notebook_config.py
