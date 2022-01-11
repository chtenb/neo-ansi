#!/bin/bash
python3 yamltotm/yamltotm.py -d palettes/material-dark.yaml ansi16.header.yaml templates/ansi16*.yaml output/material-dark-ansi16.tmTheme
python3 yamltotm/yamltotm.py -d palettes/ansi-terminal.yaml ansi16.header.yaml templates/ansi16*.yaml output/ansi16.tmTheme
python3 yamltotm/yamltotm.py templates/vscode-synthwave.json -d palettes/material-dark.yaml -r output/vscode-synthwave-material-dark-ansi16.json