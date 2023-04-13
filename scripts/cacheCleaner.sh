#!/bin/bash

echo "Clearing PageCache, dentries, and inodes..."

# Clear the page cache
sync
echo 1 > /proc/sys/vm/drop_caches

# Clear the dentries and inodes
sync
echo 2 > /proc/sys/vm/drop_caches

# Clear the page cache, dentries, and inodes
sync
echo 3 > /proc/sys/vm/drop_caches

echo "Cache cleared!"
