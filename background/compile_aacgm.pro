PRO compile_aacgm
;
path  = FILE_WHICH('aacgm_v2.pro')
path  = FILE_DIRNAME(path)
SETENV, 'AACGM_v2_DAT_PREFIX=' + FILEPATH('aacgm_coeffs-13-', root=path, subdir='coeffs')  
SETENV, 'IGRF_COEFFS=' + FILEPATH('magmodel_1590-2020.txt', root=path)




resolve_routine, 'genmag', /quiet
resolve_routine, 'igrflib_v2', /quiet
resolve_routine, 'aacgmlib_v2', /quiet
resolve_routine, 'aacgm_v2', /quiet
resolve_routine, 'time', /quiet
resolve_routine, 'astalg', /quiet
resolve_routine, 'mlt_v2', /quiet

END
