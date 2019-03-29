REM pushd ../downloads/incubator-superset/superset/static
cd ../downloads/incubator-superset/superset/static
echo %cd%
rm assets
mklink /J "assets" "../assets"
