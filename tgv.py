##PARAMETERS SPECIFICATION FOR TGV VALIDATION CASE
##
## CHANGES REQUIRED FROM SRC CODE

file = {}

# incompact.prm
file[1] = {}
file[1]['name'] = 'incompact3d.prm'
file[1]['xlx'] = 3.14
file[1]['yly'] = 3.14
file[1]['zlz'] = 3.14
file[1]['re'] = 1600.
file[1]['noise'] = 0.
file[1]['noise1'] = 0.
file[1]['dt'] = 0.001
file[1]['nclx'] = 0
file[1]['ncly'] = 0
file[1]['nclz'] = 0
file[1]['itype'] = 6
file[1]['ilast'] = 20000
file[1]['nscheme'] = 2
file[1]['istret'] = 0
file[1]['iscalar'] = 0
file[1]['imodulo'] = 1000

# module_param.f90
file[2] = {}
file[2]['name'] = 'module_param.f90'
file[2]['nx'] = 128
file[2]['ny'] = 128
file[2]['nz'] = 128

file[2]['nphi'] = 1

file[2]['p_row'] = 4
file[2]['p_col'] = 4

file[2]['nxm'] = 'nx'
file[2]['nym'] = 'ny'
file[2]['nzm'] = 'nz'
