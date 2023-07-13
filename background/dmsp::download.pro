FUNCTION url_callback, status, progress, data
PRINT, status
RETURN, 1
END




PRO dmsp::download, ssj=ssj, ssm=ssm, success, local_file
;
COMPILE_OPT IDL2
;
success = 0
CATCH, error_status
IF error_status NE 0 THEN BEGIN
    CATCH, /CANCEL
	PRINT, !ERROR_STATE.MSG
    PRINT, remote_file
	;
    ourl->GetProperty, RESPONSE_CODE=rc, RESPONSE_HEADER=rh, $
                       RESPONSE_FILENAME=rf
    PRINT, '% Response Code = ' + string(rc)
    PRINT, '% Response Header = ' + rh
    PRINT, '% Response Filename = ' + rf
    PRINT, ' '
    PRINT, '% Request stoped'
	;
    OBJ_DESTROY, ourl
    success=0
    fn     = ''
    RETURN
ENDIF


;
;*----------   ----------*
;
;
date = '% Year: ' + STRING(self.yr, FORMAT='(I04)') + ' Month: ' + $
       STRING(self.mon, FORMAT='(I02)') + ' Day: ' + STRING(self.dy, FORMAT='(I02)')
PRINT, date

;-------------------------------------------------+
; IDL net url
;-------------------------------------------------+
ourl = OBJ_NEW('IDLnetURL')
;user = 'IDL' + !VERSION.RELEASE
IF FLOAT(!VERSION.RELEASE) LE 8.4 THEN $
    ourl->SETPROPERTY, SSL_VERIFY_PEER=0
;
IF KEYWORD_SET(ssj) THEN BEGIN
	remote_file = self->fileurl(/ssj)
	local_file  = self->filename(/ssj)
    print, 'Downloading: ' + remote_file
ENDIF
IF KEYWORD_SET(ssm) THEN BEGIN
	remote_file = self->fileurl(/ssm)
	local_file  = self->filename(/ssm)
    print, 'Downloading: ' + remote_file
ENDIF
;
dum = ourl->Get(URL=remote_file, FILENAME=local_file)
print, 'Saved file: ' + local_file
;
success = 1
END
