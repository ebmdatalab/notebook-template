## Docker enviroment

### Installation

Docker allows you to run identical software on all platforms. In
Windows, in particular, there are challenges ensuring all python
packages are exactly the same as those available on other platforms.

Windows and Macs have different installation processes. Regardless of machine, you will have to install 
Docker and make an acccount. Please follow installation instructions on the docker website
[here](https://docs.docker.com/install/) for how to complete this step. Docker Desktop is preferred over Docker Toolbox. 


#### Windows

If running on Windows, you
may find it useful first to refer to our own installation notes
[here](https://github.com/ebmdatalab/custom-docker/issues/4) which cover Desktop/Toolbox and other installation questions.

Windows users who log into an Active Directory domain (i.e. a network
login) may find they lack permissions to start Docker correctly. If
so, follow [these
instructions](https://github.com/docker/for-win/issues/785#issuecomment-344805180).

#### Macs

Follow the instructions from the Docker website. You may have to restart your computer during installation. 

Once you have Docker installed, you will need to log in. This can be accessed via the Applications Folder
and once you have logged in, you should have the Docker icon on the top taskbar (ie. next to battery icon, etc.)

Once this is running, you should be able to use Docker. 

#### Gotchas

- The first time you use Docker or use a new Docker template, please be aware that it takes  a long time to make the build.
It is easy to think that it has frozen, but it will make quite a while to get going. 

    If this is the case, look at this cat whilst you wait: 

![Alt Text](https://media.giphy.com/media/vFKqnCdLPNOKc/giphy.gif)