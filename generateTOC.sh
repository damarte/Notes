#!/bin/bash

TOC="# Notas"
IFS=$'\n'; set -f
CURRENT_FOLDER=""
for file in $(find . -name '*.md'); do

    if [[ "$file" != "./README.md" ]]; then

        FOLDER=$(dirname "${file}")
        FOLDER=${FOLDER#"./"}
        if [[ "$CURRENT_FOLDER" != "$FOLDER" ]]; then
            TOC+="\n\n## $FOLDER\n"
            CURRENT_FOLDER=$FOLDER
        fi

        FILE=$(basename "${file}")

        TITLE=$(head -n 1 "${file}")
        TITLE=${TITLE#"# "}

        TOC+="\n- [$TITLE]($file)"
    fi

done
unset IFS; set +f

echo $TOC | tee ./README.md
