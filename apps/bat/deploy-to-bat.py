#!/usr/bin/env python

import os
import shutil
import subprocess
from pathlib import Path


def get(*command):
    result = subprocess.run(command, capture_output=True, universal_newlines=True, shell=False)
    return result.stdout


def out(*command):
    subprocess.run(command, universal_newlines=True, shell=False)


current_dir = Path(os.path.dirname(os.path.abspath(__file__)))
file_path = current_dir / '../../syntax/terminal-neo-ansi.tmTheme'
config_dir = Path(get('bat', '--config-dir').strip())
themes_dir = config_dir / 'themes'
os.makedirs(themes_dir, exist_ok=True)
print(f'Copying {file_path} to {themes_dir}')
shutil.copy(file_path, themes_dir)

out('bat', 'cache', '--build')
