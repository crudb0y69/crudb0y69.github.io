#! /bin/bash

git add .
git commit -m "add website favicon"
git push origin backup

hexo clean
hexo g
hexo d