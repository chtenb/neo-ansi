import sys
import os
import glob
import subprocess

def run(command):
    subprocess.run(command, input=None, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True, shell=True)

run('rm *.tmTheme')

for palette in glob.glob('palettes/*.yaml'):
    print('Generating tmTheme for ' + palette)
    palette_name = os.path.splitext(os.path.basename(palette))[0]
    result_name = palette_name + '-ansi16.tmTheme'
    if palette_name == 'terminal':
        result_name = 'ansi16.tmTheme'
    run(f'python yamltotm/yamltotm.py -d {palette} ansi16.header.yaml templates/ansi16*.yaml {result_name}')
