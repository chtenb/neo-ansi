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

existing = glob.glob('*.tmTheme')
if existing:
    print(f'Removing existing {existing}')
    for file in existing:
        os.remove(file)

for palette in glob.glob('palettes/*.yaml'):
    print('Generating tmTheme for ' + palette)
    palette_file = os.path.basename(palette)
    palette_name = os.path.splitext(palette_file)[0]
    result_name = palette_name + '-ansi16.tmTheme'
    run(python, './yamltotm/yamltotm.py', '-d',
        f'palettes/{palette_file}', 'ansi16.header.yaml', *glob.glob('templates/ansi16*.yaml'), result_name)
