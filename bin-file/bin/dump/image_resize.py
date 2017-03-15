#!/usr/bin/env pythno3
import os
import io
import requests
from PIL import Image
import tempfile


'''
read online image and create a thumbnail without saving at first

'''



img_url = 'http://cdn.zonarutoppuden.com/ns/peliculas-naruto-shippuden.jpg'
out_dir = 'x'
SIZE = (300, 300)

buffer = tempfile.SpooledTemporaryFile(max_size=1e9)
r = requests.get(img_url, stream=True)
if r.status_code == 200:
    downloaded = 0
    filesize = int(r.headers['content-length'])
    for chunk in r.iter_content():
        downloaded += len(chunk)
        buffer.write(chunk)
        print(downloaded/filesize)
    buffer.seek(0)
    i = Image.open(io.BytesIO(buffer.read()))
    i.convert('RGB')
    i.thumbnail(SIZE, Image.ANTIALIAS)
    i.save(os.path.join(out_dir, 'image.jpg'), quality=80)
buffer.close()
