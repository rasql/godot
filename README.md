# godot
Godot showcase


## Create a virtual environment
Creating a virtual environment isolates the
 Python modules needed for the project from the base installation and avoids conflicts.  
 We install it in the hidden folder `.venv` and add it to the `.gitignore` file.

Source: 
https://www.w3schools.com/python/python_virtualenv.asp

- using `pip list` shows more than 100 Python modules installed
- install the virtual environment with `python3 -m venv .venv`
- activate with `source .venv/bin/activate`
- check with `pip list` shows only `pip 25.2` installed
- deactivate with: `deactivate`

The hidden folder `.venv` contains:
- bin
- include
- lib
- pyenv.cfg

## Install Sphinx

Sphinx is a documentation generator written in Pyhton to create user guides and documentation on the web.

Source: https://www.sphinx-doc.org

- install sphinx with `pip3 install -U sphinx`
- this installs 22 modules (alabaster, babel, ...)
- install furo with `pip install furo`
- this installs 7 more modules
- install MyST-Parser: `pip install myst-parser`
- now at 34 modules installed

Check the version

```
(.venv) % sphinx-build --version
sphinx-build 4.2.0
```

## Quickstart

Source: https://www.sphinx-doc.org/en/master/tutorial/getting-started.html

- create a demo with `sphinx-quickstart demo
    - separate source and build: yes
    - project: Lumache
    - author: Graziella
    - release: 0.1
    - language: en
- enter the folder with `cd demo`
- run `make html`
- open the file `build/html/index.html``


## Take image capture

- press `cmd+ctrl+5``
- select the region
- save to the `images` folder
- rename

## HTML5 Games 

- Place the HTML5 games into the `_static` folder

