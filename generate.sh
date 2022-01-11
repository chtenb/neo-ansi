#!/bin/bash
python3 yamltotm/yamltotm.py templates/ansi16.template.yaml -d palettes/material-dark.palette.yaml output/material-dark-ansi16.tmTheme
python3 yamltotm/yamltotm.py templates/ansi16.template.yaml -d palettes/ansi-terminal.palette.yaml output/ansi16.tmTheme