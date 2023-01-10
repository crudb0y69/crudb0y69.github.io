#! /bin/bash

git add .
git commit -m "backup"
git push origin backup

hexo clean
hexo g
hexo d