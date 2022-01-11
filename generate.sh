#!/bin/bash
python3 yamltotm/yamltotm.py templates/ansi16.yaml -d palettes/material-dark.yaml output/material-dark-ansi16.tmTheme
python3 yamltotm/yamltotm.py templates/ansi16.yaml -d palettes/ansi-terminal.yaml output/ansi16.tmTheme
python3 yamltotm/yamltotm.py templates/vscode-synthwave.json -d palettes/material-dark.yaml -r output/vscode-synthwave-material-dark-ansi16.json