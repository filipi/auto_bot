#!/usr/bin/env python

# Fortran + MPI numerical simulation experiments automated validation tool.
# authors
#     Ricardo Frantz <ricadro.frantz@acad.pucrs.br> and
#     Filipi Vianna <filipi.vianna@pucrs.br>
#     Trying to meet Tulio's quality standards ;-)
# September, 2017

import argparse #https://docs.python.org/2/library/argparse.html
import os
import shutil
import fileinput
import re
import importlib

from subprocess import call

## a small function that prints a string without breaking the line at the end
## https://stackoverflow.com/questions/493386/how-to-print-without-newline-or-space
def printNNL(string):
    import sys
    sys.stdout.write(string)
    sys.stdout.flush()    

def checkFile(filename, error):
    printNNL('Filename: ' + filename)
    if os.path.isfile(filename):
        print ' [  OK  ]'
    else:
        print ' [ FAIL ]'
        error = True
    return error

## TODO
# Add an option to automaticaly generate an example case file.

# First checks if all files are present in source_dir
# Copy source_dir for each case in cases
# replace vars in case.file[]

parser = argparse.ArgumentParser(description='Fortran + MPI numerical simulation experiments automated validation tool.')
parser.add_argument('-c','--cases', metavar='case', nargs='+',
                    help='<Required> case names whitout .py extension', required=True)
parser.add_argument('--src', metavar='source_dir', type=str,
                    help='Path for the template simulation (default ./src/)')
parser.add_argument('--path', metavar='path', type=str,
                    help='Path were to run the experiments (default .)')

## ./optimus_prime.py -c channel cylinder tgv
args = parser.parse_args()
if args.path is None:
    args.path = '.'
if args.src is None:
    args.src = './src'

print 'path: ' + args.path
print 'source_dir: ' + args.src

error = False;
for case in args.cases:
    print('Checking cases...')
    error = checkFile(case + '.py', error)

    # First check if all the files exist
    print '#################################################'
    print 'Case: ' + case
    print('Checking files...')
    
    if not error:
        c = importlib.import_module(case)   
        for i in c.file:
            if c.file[i]['name']:
                error = checkFile(args.src + '/' + c.file[i]['name'], error)
        
if error:
    quit()
        

for case in args.cases:
    for i in c.file:
        print '------------------------------------------------'
        print 'Filename: ' + c.file[i]['name']
        for j in c.file[i]:            
            if j != 'name':
                print j + ' = ' + str(c.file[i][j])
    
    

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
