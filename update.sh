#!/bin/bash

# Takes modrinth.index.json as input (the manifest of a given .mrpack)

echo "# Goblins" > README.md
echo "The Goblins modpack." >> README.md
echo "" >> README.md
echo "# Contents" >> README.md

jq --indent 0 '.. | select(type == "object" and has("downloads")).downloads' modrinth.index.json | sed s/\]/\/ | sed s/\\[/*\ / | sed s/\"// | sed s/\"// >> README.md
cat README.md
