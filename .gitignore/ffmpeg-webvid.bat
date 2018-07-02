@echo off

REM https://gist.github.com/Vestride/278e13915894821e1d6f

ECHO Encode to mp4 h264
REM ffmpeg -i %1.mov -vcodec h264 -strict -2 %2.mp4
ECHO mp4 done.

ECHO Encode to webm (Google VP9)
REM ffmpeg -i %1.mov -vcodec libvpx-vp9 -b:v 1M -acodec libvorbis %2.webm
ffmpeg -i %1.mov -vcodec libvpx -qmin 0 -qmax 50 -crf 10 -b:v 1M %2.webm
ECHO webm done.


REM HTML to copy/pasta

ECHO ^<!-- html output --^>
ECHO ^<video^>
ECHO  ^<source src="%2.webm" type="video/webm; codecs=vp9,vorbis"^>
ECHO  ^<source src="%2.mp4" type="video/mp4"^>
ECHO ^</video^>
ECHO ^<!-- html output --^>
GOTO END

:ERRORPARAMS
    ECHO.
    ECHO Must specify both parameters. For input, do not include .mov file extension
    ECHO ffmpeg-webvid inputfile outputfile
    GOTO END

END:
ECHO end.

PAUSE
