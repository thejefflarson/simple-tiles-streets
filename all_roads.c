#include <simple-tiles/simple_tiles.h>
#include <simple-tiles/filter.h>
#include <simple-tiles/layer.h>

int
main(){
  simplet_map_t *map = simplet_map_new();
  simplet_map_set_srs(map, "EPSG:3083");
  simplet_map_set_bgcolor(map, "#ffffff");
  simplet_map_set_bounds(map, -585080.885134, 6849466.721081, 4161303.603672, 9587780.816356);
  simplet_map_set_size(map, 423, 260);
  simplet_layer_t *layer = simplet_map_add_layer(map, "PG:dbname=simple_tiles_roads");
  simplet_filter_t *filter = simplet_layer_add_filter(layer, "select * from roads");
  simplet_filter_add_style(filter, "stroke", "#11111166");
  simplet_filter_add_style(filter, "line-join", "round");
  simplet_filter_add_style(filter, "weight", "0.1");

  simplet_map_render_to_png(map, "./out.png");
  simplet_map_free(map);
}
