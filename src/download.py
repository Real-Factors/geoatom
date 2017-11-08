from __future__ import print_function
from argparse import ArgumentParser

import requests

from pathlib import Path
from zipfile import ZipFile
from shutil import rmtree
from io import BytesIO
from os import remove

from yaml import load, YAMLError


def set_config(file_name):
    with open(file_name, 'r') as cfg:
        try:
            config = load(cfg)
        except YAMLError as exc:
            print(exc)
    return config


def extract_zip(zfile, path):
    zip_ref = ZipFile(zfile, 'r')
    zip_ref.extractall(path)
    zip_ref.close()


def build_urls(conf, base='base_url'):
    """
    Returns a dict of key: openaddress S3 url pairs given a base url and
    geographic identifier
    """
    return {x: conf[base] + conf[x] for x in conf if x != base}


def clean_dir(directory):
    """
    input: PathLib path object
    cleans a directory of all files without destroying the directory
    """
    for d in directory.iterdir():
        fp = str(d.resolve())
        if d.is_dir():
            rmtree(fp)
        else:
            remove(fp)


def parse_args():
    parser = ArgumentParser(
        description='Login credentials for RF AWS DB')

    parser.add_argument('--DATA_RESOURCE',
                        nargs='*',
                        help='Specify a data resource',
                        type=str,
                        default='openaddress')

    parser.add_argument('--OA_COLLECTION',
                        nargs='*',
                        help='Specify a collection as listed on the openaddressess.io download page (default = us_northeast)',
                        type=str,
                        default=['us_northeast'])

    return parser.parse_args()


if __name__ == '__main__':

    args = parse_args()

    import ipdb
    ipdb.set_trace()

    cp = Path('..') / 'data_config.yaml'
    data_conf = set_config(str(cp.resolve()))[args.DATA_RESOURCE]
    meta_conf = set_config(str(cp.resolve()))['meta']
    # LOCAL ONLY FOR NOW -- ADD S3 support
    dp = Path('..') / meta_conf['local']

    # build download urls from intersection of all possible urls &
    # CLI parameter input
    try:
        download_urls = {x: build_urls(
            data_conf)[x] for x in args.OA_COLLECTION}
    except KeyError as e:
        print("Check the collection name and try again. Refer to data_config.yaml for more info")

    if not dp.exists():  # check to make sure data directory exists
        dp.mkdir()

    # download full data directly -- TO DO: UPDATE DATA BASED ON DATE

    # DELETES ALL FILES IN DATA DIR IF DIR IS NOT EMPTY
    if len([d for d in dp.iterdir()]) != 0:
        clean_dir(dp)

    # Download files and unzip them
    for key, url in download_urls.items():
        r = requests.get(url, stream=True)
        if r.ok:
            url_dir = dp / Path(key)
            url_dir.mkdir()
            z = ZipFile(BytesIO(r.content))
            z.extractall(str(url_dir.resolve()))
        else:
            print("connection likely broken for {}: {}".format(key, url))
