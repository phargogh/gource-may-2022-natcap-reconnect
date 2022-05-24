#!/usr/bin/env sh

EXT="glog"

make_gource_log() {
    echo "Building logfile for $1"
    NAME=$(basename "$1")
    gource --output-custom-log "$NAME.$EXT" "$1"
    gsed -i -r "s#(.+)\|#\1|/$NAME#" "$NAME.$EXT"
}

rm combined.gource

make_gource_log ~/workspace/natcap/invest
make_gource_log ~/workspace/natcap/invest.users-guide
make_gource_log ~/workspace/natcap/marineapps.naturalcapitalproject.org
make_gource_log ~/workspace/natcap/urban-online-workflow/
make_gource_log ~/workspace/natcap/nci-noxn-levels/
make_gource_log ~/workspace/phargogh/2021-nci-ndr-sherlock/
make_gource_log ~/workspace/natcap/global-web-viewer/
make_gource_log ~/workspace/natcap/taskgraph/
make_gource_log ~/workspace/natcap/pygeoprocessing
make_gource_log ~/workspace/natcap/root
#make_gource_log ~/workspace/natcap/viz.Stanford/


find . -name "*.$EXT" | xargs cat | sort -n > combined.gource
gsed -i 's/Dave Fisher/David Fisher/g' combined.gource
gsed -i 's/|Dave|/|David Fisher|/g' combined.gource
gsed -i 's/davemfish/David Fisher/g' combined.gource
gsed -i 's/Doug Denu ddenu/Doug Denu/g' combined.gource
gsed -i 's/|Doug|/|Doug Denu|/g' combined.gource
gsed -i 's/dcdenu4/Doug Denu/g' combined.gource
gsed -i 's/Richard Sharp/Rich Sharp/g' combined.gource
gsed -i 's/|richpsharp|/|Rich Sharp|/g' combined.gource
gsed -i 's/richpsharp@gmail.com/Rich Sharp/g' combined.gource
gsed -i 's/jamesdouglassusa@gmail.com/James Douglass/g' combined.gource
gsed -i 's/emlys/Emily Soth/g' combined.gource
gsed -i 's/|Emily|/|Emily Soth|/g' combined.gource
gsed -i 's/j_goldstein/Jesse Goldstein/g' combined.gource
gsed -i 's/lmandle/LisaMandle/g' combined.gource


gource \
    --start-date 2020-01-01 \
    --seconds-per-day 0.5 \
    --user-image-dir avatars \
    --high-dpi \
    combined.gource
