find ./ -name 'tileset_1.0.json' > scripts/all_tileset_1.0json.paths
find ./ -name 'tileset_1.1.json' > scripts/all_tileset_1.1json.paths
find ./ -name 'tileset.json' > scripts/all_tilesetjson.paths
#cat scripts/*paths > scripts/combined_tileset.paths
(for f in `cat scripts/all_tilesetjson.paths`; do echo echo converting $f; echo npx ts-node /workspaces/3d-tiles-tools/src/cli/main.ts upgrade --targetVersion 1.1 -i $f -o ../output_from_1.0/`dirname $f`; done) > scripts/convert_bare.sh
(for f in `cat scripts/all_tileset_1.0json.paths`; do echo echo converting $f; echo npx ts-node /workspaces/3d-tiles-tools/src/cli/main.ts upgrade --targetVersion 1.1 -i $f -o ../output_from_1.0_explicit/`dirname $f`; done) > scripts/convert_from1.0.sh
(for f in `cat scripts/all_tileset_1.1json.paths`; do echo echo converting $f; echo npx ts-node /workspaces/3d-tiles-tools/src/cli/main.ts upgrade --targetVersion 1.1 -i $f -o ../output_from_1.1_explicit/`dirname $f`; done) > scripts/convert_from1.1.sh
#sh scripts/convert_bare.sh
#sh scripts/convert_from1.0.sh
#sh scripts/convert_from1.1.sh