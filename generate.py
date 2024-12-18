#!/usr/bin/env python

import sys
import os
import glob
import subprocess


def run(*command):
    print(*command)
    return subprocess.run(command, input=None, stdout=sys.stdout, stderr=sys.stderr, universal_newlines=True, shell=False).returncode


def run_silent(*command):
    return subprocess.run(command, input=None, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True, shell=False).returncode


python = 'python'
if run_silent('python3', '-V') == 0:
    python = 'python3'

syntax_subfolder = 'syntax/'

existing = glob.glob(syntax_subfolder + '*.tmTheme')
if existing:
    print(f'Removing existing {existing}')
    for file in existing:
        os.remove(file)

for palette in glob.glob('palettes/*.yaml'):
    print('Generating tmTheme for ' + palette)
    palette_file = os.path.basename(palette)
    palette_name = os.path.splitext(palette_file)[0]
    result_name = syntax_subfolder + palette_name + '-neo-ansi.tmTheme'
    run(python, './yamltotm/yamltotm.py', '-d',
        f'palettes/{palette_file}', 'syntax/neo-ansi.header.yaml', *glob.glob('syntax/templates/neo-ansi*.yaml'), result_name)

existing = glob.glob('terms/wezterm/generated/*')
if existing:
    print(f'Removing existing {existing}')
    for file in existing:
        os.remove(file)

for palette in glob.glob('palettes/*.yaml'):
    if 'terminal.yaml' in palette:
        continue
    print('Generating wezterm theme for ' + palette)
    palette_file = os.path.basename(palette)
    palette_name = os.path.splitext(palette_file)[0]
    # Generate toml theme
    result_name = 'terms/wezterm/generated/' + palette_name + '-neo-ansi.toml'
    run(python, './yamltotm/yamltotm.py', '-d',
        f'palettes/{palette_file}', 'terms/wezterm/template.toml', '-r', result_name)
    # Generate lua theme
    result_name = 'terms/wezterm/generated/' + palette_name + '-neo-ansi.lua'
    run(python, './yamltotm/yamltotm.py', '-d',
        f'palettes/{palette_file}', 'terms/wezterm/template.lua', '-r', result_name)
