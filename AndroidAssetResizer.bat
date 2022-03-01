@REM Android Image Resizer
@REM Copyright (c) Laky-64 (https://github.com/Laky-64)
@REM Licensed under the MIT License (https://opensource.org/licenses/MIT)

@echo off

@REM ### BEGIN CONFIGURATION ###
set IMAGE_MAGICK_PATH="D:\ImageMagick-7.1.0-Q16-HDRI\convert.exe"
set PATH_MDPI=drawable-mdpi
set PATH_HDPI=drawable-hdpi
set PATH_XHDPI=drawable-xhdpi
set PATH_XXHDPI=drawable-xxhdpi
set MDPI_FACTOR=10
set HDPI_FACTOR=15
set XHDPI_FACTOR=20
set XXHDPI_FACTOR=30
@REM ### END CONFIGURATION ###

echo Resize all PNGs in this script's folder for all densities?
echo Type your wanted image size for this assets. Example: 48
set /p IMAGE_SIZE=

if NOT exist %PATH_MDPI% (
	mkdir %PATH_MDPI%
)
if NOT exist %PATH_HDPI% (
	mkdir %PATH_HDPI%
)
if NOT exist %PATH_XHDPI% (
	mkdir %PATH_XHDPI%
)
if NOT exist %PATH_XXHDPI% (
	mkdir %PATH_XXHDPI%
)

set /A IMAGE_MDPI_SIZED=((IMAGE_SIZE*10)*MDPI_FACTOR)/100
set /A IMAGE_HDPI_SIZED=((IMAGE_SIZE*10)*HDPI_FACTOR)/100
set /A IMAGE_XHDPI_SIZED=((IMAGE_SIZE*10)*XHDPI_FACTOR)/100
set /A IMAGE_XXHDPI_SIZED=((IMAGE_SIZE*10)*XXHDPI_FACTOR)/100

for %%f in (*.png) do (
	echo %%f
	
	"%IMAGE_MAGICK_PATH%" "%%f" -resize "%IMAGE_MDPI_SIZED%x%IMAGE_MDPI_SIZED%" "%~dp0%PATH_MDPI%\%%f"

	"%IMAGE_MAGICK_PATH%" "%%f" -resize "%IMAGE_HDPI_SIZED%x%IMAGE_HDPI_SIZED%" "%~dp0%PATH_HDPI%\%%f"

	"%IMAGE_MAGICK_PATH%" "%%f" -resize "%IMAGE_XHDPI_SIZED%x%IMAGE_XHDPI_SIZED%" "%~dp0%PATH_XHDPI%\%%f"

	"%IMAGE_MAGICK_PATH%" "%%f" -resize "%IMAGE_XXHDPI_SIZED%x%IMAGE_XXHDPI_SIZED%" "%~dp0%PATH_XXHDPI%\%%f"
)

echo.
echo Finished

pause