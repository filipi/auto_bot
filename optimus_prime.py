#!/usr/bin/env python

# Fortran + MPI numerical simulation experiments automated validation tool.
# authors
#     Ricardo Frantz <ricadro.frantz@acad.pucrs.br> and
#     Filipi Vianna <filipi.vianna@pucrs.br>
# September, 2017

import argparse #https://docs.python.org/2/library/argparse.html
import os
import shutil
import fileinput
import re
import importlib

from subprocess import call

parser = argparse.ArgumentParser(description='Fortran + MPI numerical simulation experiments automated validation tool.')
parser.add_argument('-c','--cases', metavar='cases', nargs='+', help='<Required> Set flag', required=False)
parser.add_argument('--src', metavar='source_dir', type=str,
                    help='Path for the template simulation (default ./src)')
parser.add_argument('--path', metavar='path', type=str,
                    help='Path were to run the experiments (default .)')

## ./optimus_prime.py -c channel cylinder tg
args = parser.parse_args()

for case in args.cases:
    print(case)

    c = importlib.import_module(case)
    print(c.xlx) #check if importing
  

# for testing_case in range(args.start, args.end, args.factor if args.factor else 1):
#     path = 'case_' + args.var + '_' +  str(testing_case).zfill( len(str(args.end)) )
#     print( path )
#     try:
#         shutil.copytree(args.src if  args.src else './src', path)    
#     except OSError, e:
#         pass

#     #os.chdir( path )
#     filename = path + '/' + (args.prm if  args.prm else 'incompact3d.prm')
#     origin = open ( filename, 'r' )
#     content = origin.read()
#     content_new = re.sub('(\d.|\d.\.).*\#' + args.var + '\s', str(testing_case) +  '.\t#' + args.var + ' ', content, flags = re.M)
#     origin.close()
#     destiny = open (filename, 'w' )
#     destiny.write(content_new)

#     ##call(["make", ""])
#     ##call(["mpi_rum", ""])

#mkdir caso_1 &&
#cp -Rf src caso_1 &&
#cd caso_1 &&
#sed -ie 's/(\d.\d.*?)\#re/3000\t\#re/g' hello.txt
#make &&
#mpi_run .. &&
