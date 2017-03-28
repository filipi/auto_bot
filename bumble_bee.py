#!/usr/bin/env python

import argparse #https://docs.python.org/2/library/argparse.html
import os
import shutil
import fileinput
import re

from subprocess import call

parser = argparse.ArgumentParser(description='Fortran + MPI numerical simulation experiments automation tool.')
parser.add_argument('var', metavar='variable', type=str,
                    help='the variable to change in fortran code')
parser.add_argument('start', metavar='start', type=int,
                    help='Start value for the chosen variable to loop.')
parser.add_argument('end', metavar='end', type=int,
                    help='End value for the chosen variable to loop.')
parser.add_argument('--factor', metavar='increment', type=int,
                    help='Factor to use when incrementing variable')
parser.add_argument('--prm', metavar='param_file', type=str,
                    help='Fortran parameters file to locate VAR (default incompact3d.prm)')
parser.add_argument('--src', metavar='source_dir', type=str,
                    help='Path for the template simulation (default ./src)')
parser.add_argument('--path', metavar='path', type=str,
                    help='Path were to run the experiments (default .)')

for testing_case in range(args.start, args.end, args.factor if args.factor else 1):
    path = 'caso_' +  str(testing_case).zfill( len(str(args.end)) )
    print( path )
    try:
        shutil.copytree(args.src if  args.src else './src', path)    
    except OSError, e:
        pass

    #os.chdir( path )
    filename = path + '/' + (args.prm if  args.prm else 'incompact3d.prm')
    origin = open ( filename, 'r' )
    content = origin.read()
    content_new = re.sub('(\d.|\d.\.).*\#' + args.var, str(testing_case) +  '.\t#' + args.var, content, flags = re.M)
    origin.close()
    destiny = open (filename, 'w' )
    destiny.write(content_new)

    ##call(["make", ""])
    ##call(["mpi_rum", ""])

#mkdir caso_1 &&
#cp -Rf src caso_1 &&
#cd caso_1 &&
#sed -ie 's/(\d.\d.*?)\#re/3000\t\#re/g' hello.txt
#make &&
#mpi_run .. &&
