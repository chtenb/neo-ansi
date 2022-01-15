#!/usr/bin/env python

import shutil
import sys
import os
import glob
import subprocess

def run(*command):
    print(*command)
    subprocess.run(command, input=None, stdout=sys.stdout, stderr=sys.stderr, universal_newlines=True, shell=False)

def cmd_exists(cmd):
    return shutil.which(cmd) is not None

python = 'python'
if cmd_exists('python3'):
    python = 'python3'

existing = glob.glob('*.tmTheme')
if existing:
    print(f'Removing existing {existing}')
    run('rm', *existing)

for palette in glob.glob('palettes/*.yaml'):
    print('Generating tmTheme for ' + palette)
    palette_file = os.path.basename(palette)
    palette_name = os.path.splitext(palette_file)[0]
    result_name = palette_name + '-ansi16.tmTheme'
    run(python, './yamltotm/yamltotm.py', '-d', f'palettes/{palette_file}', 'ansi16.header.yaml', *glob.glob('templates/ansi16*.yaml'), result_name)
