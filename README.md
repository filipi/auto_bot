auto_bot is a set of automation scripts

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
~$ git clone git@bitbucket.org:filipivianna/auto_bot.git
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




