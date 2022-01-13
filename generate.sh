#!/bin/bash
python3 yamltotm/yamltotm.py -d palettes/material-dark.yaml ansi16.header.yaml templates/ansi16*.yaml output/material-dark-ansi16.tmTheme
python3 yamltotm/yamltotm.py -d palettes/material-light.yaml ansi16.header.yaml templates/ansi16*.yaml output/material-light-ansi16.tmTheme
python3 yamltotm/yamltotm.py -d palettes/noctis-lux.yaml ansi16.header.yaml templates/ansi16*.yaml output/noctis-lux-ansi16.tmTheme
python3 yamltotm/yamltotm.py -d palettes/terminal.yaml ansi16.header.yaml templates/ansi16*.yaml output/ansi16.tmTheme
