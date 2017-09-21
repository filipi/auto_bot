## PARAMETERS SPECIFICATION FOR TGV VALIDATION CASE
##
## CHANGES REQUIRED FROM SRC CODE
##

## CASE FILE TO BE USED BY THE OPTIUMS_PRIME AUTO_BOT
##
## To specify the parameters to change with the autobot,
## add another dicionary to the file dictionary:
## file[N] = {} # where N is a number for each file
## you want to replace parameters
##
## Example:
#
# file = {}
#
# file[1] = {}
# file[1]['name'] = 'file_A.f90' # file to replace parameters
# file[1]['nx'] = 1.             # assign 1. to the variable nx on file_A.f90
#
# file[2] = {}
# file[2]['name'] = 'file_B.f90'
# file[2]['nx'] = 2.

file = {}
file[1] = {}

# incompact.prm
file[1]['name'] = 'incompact3d.prm'
file[1]['xlx'] = 12.5663706144
file[1]['yly'] = 2.
file[1]['zlz'] = 4.18879020479
file[1]['re'] = 4200.
file[1]['noise'] = 0.125
file[1]['dt'] = 0.005
file[1]['nclx'] = 0
file[1]['ncly'] = 2
file[1]['nclz'] = 0
file[1]['itype'] = 2
file[1]['ilast'] = 1000
file[1]['nscheme'] = 2
file[1]['istret'] = 2
file[1]['beta'] = 0.259065151
file[1]['iscalar'] = 0
file[1]['isave'] = 500
file[1]['imodulo'] = 500

# module_param.f90
file[2] = {}
file[2]['name'] = 'module_param.f90'
file[2]['nx'] = 128
file[2]['ny'] = 129
file[2]['nz'] = 84

file[2]['nphi'] = 1

file[2]['p_row'] = 4
file[2]['p_col'] = 4

file[2]['nxm'] = 'nx'
file[2]['nym'] = 'ny - 1'
file[2]['nzm'] = 'nz'

