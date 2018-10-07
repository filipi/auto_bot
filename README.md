# Auto_bot #

Auto_bot is a set of automation scripts written in python to automate the process of
running numerical simulation experiments. It is particularly suitable to run tests at
[Incompact3D](https://github.com/xcompact3d).There are currently only two bots,
bumble_bee and optimus_prime.

Each bot needs a fortram simulation source tree to be cloned by the bot for each
new simulation case created by the bot. The bot will clone the source tree and
replace values of the parameters and/or variable necessary to run the validation
trials.

## Bumble_bee ##

Bumble_bee changes a single parameters in a fortram parameters file to create
several test cases with different values for the chosen parameter. One can, 
for example, try different Reynolds number (Re) values in a computational fluid dynamics
(CFD) simulation.

## Optimus_prime ##

Optimus_prime bot changes more variables and parameters in the fortram code.
It is meant to prepare te code to run validation cases. The
validation case can be specified in a python setup file.
Which will have the the parameters and variables with respective
new values to be replaced in the fortram original source code.

### Optimus_prime case file ###

To specify the parameters to change with the autobot,
add another dicionary to the file dictionary:
file[N] = {} # where N is a number for each file
which have parameters you want to be replaced.

Example:
```
file = {}
file[1] = {}
file[1]['name'] = 'file_A.f90' # file to replace parameters
file[1]['nx'] = 1.             # assign 1. to the variable nx on file_A.f90
file[2] = {}
file[2]['name'] = 'file_B.f90'
file[2]['nx'] = 2.
```

# Installing #

## On linux ##

```
~$ git clone git@bitbucket.org:filipivianna/auto_bot.git
~$ cd auto_bot
~/auto_bot$ chmod +x bumble_bee.py
~/auto_bot$ ./bumble_bee.py
```
## Usage ##

```
usage: bumble_bee.py [-h] [--factor increment] [--prm param_file]
                     [--src source_dir] [--path path]
                     variable start end
```

```
Fortran + MPI numerical simulation experiments automation tool.

positional arguments:
  variable            the variable to change in fortran code
  start               Start value for the chosen variable to loop.
  end                 End value for the chosen variable to loop.

optional arguments:
  -h, --help          show this help message and exit
  --factor increment  Factor to use when incrementing variable
  --prm param_file    Fortran parameters file to locate VAR (default
                      incompact3d.prm)
  --src source_dir    Path for the template simulation (default ./src)
  --path path         Path were to run the experiments (default .)

```

## Example ##

```
~$ git clone git@github.com:filipi/auto_bot.git
Cloning into 'auto_bot'...
remote: Counting objects: 20, done.
remote: Compressing objects: 100% (17/17), done.
remote: Total 20 (delta 5), reused 0 (delta 0)
Receiving objects: 100% (20/20), done.
Resolving deltas: 100% (5/5), done.
Checking connectivity... done.
~$ cd auto_bot
~/auto_bot$ chmod +x bumble_bee.py
~/auto_bot$ ./bumble_bee.py
usage: bumble_bee.py [-h] [--factor increment] [--prm param_file]
                     [--src source_dir] [--path path]
                     variable start end
bumble_bee.py: error: too few arguments
~/auto_bot$
```




