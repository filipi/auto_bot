## CASE FILE TO BE USED BY THE OPTIUMS_PRIME AUTO_BOT
##
## To specify the parameters to change with the autobot,
## add another dicionary to the file dictionary:
## file[N] = {} # where N is a number for each file
## you want to replace parameters
##
## Example:

file = {}

file[1] = {}
file[1]['name'] = 'file_A.f90' # file to replace parameters
file[1]['nx'] = 1.             # assign 1. to the variable nx on file_A.f90

file[2] = {}
file[2]['name'] = 'file_B.f90'
file[2]['nx'] = 2.

