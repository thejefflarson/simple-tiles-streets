DB="simple_tiles_roads"
PG=`pg_config --sharedir`/contrib/postgis-1.5
dropdb $DB
createdb $DB
psql -d $DB -f $PG/postgis.sql
psql -d $DB -f $PG/spatial_ref_sys.sql
shp2pgsql -W LATIN1 -s 4269 -d -p `ls data/*.shp | head -n 1` roads | psql -d $DB
for file in ls data/*.shp
do
  shp2pgsql -W LATIN1 -s 4269 -a $file roads | psql -d $DB -q
done
