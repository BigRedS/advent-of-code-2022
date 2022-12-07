#! /bin/bash

mkdir -p scratch
cd scratch

## Create dir hierarchy
scratch=$(pwd)
cat ../input | while read line; do
  dir=$(pwd)
  path=$(echo $line | awk '{print $NF}')
  if [[ $line =~ "\$ cd " ]]; then
    cd "$dir/$path"
  elif [[ $line =~ "dir " ]]; then
    mkdir -p "$dir/$path"
  elif [[ $line =~ "$ ls" ]]; then
    true
  else
    dd if=/dev/zero of="$dir/$path" bs=1 count="$(echo $line | awk '{print $1}')" 2>/dev/null
  fi
done

# Part 1: Find the biggest directory smaller than 100000
size=0
while read dir; do
  dirsize=$(find $dir -type f -exec du -sb {} \; | awk '{print $1}' | tr '\n' '+' | sed -e 's/+$//' | bc -l)
  if [[ $dirsize -lt 100001 ]]; then
    if [ -z "$dirsize" ]; then dirsize=0; fi
    size=$(($size+$dirsize))
  fi
done <<< "$(find . -type d)"

echo "Part 1: " $size

# Part 2: Find the smallest directory that's big enough to free enough space

size_of_slash=$(find $dir -type f -exec du -sb {} \; | awk '{print $1}' | tr '\n' '+' | sed -e 's/+$//' | bc -l)
unused_space=$((70000000-$size_of_slash))
space_needed=$((30000000-$unused_space))
last_dir="";
while read dir; do
  dirsize=$(find $dir -type f -exec du -sb {} \; | awk '{print $1}' | tr '\n' '+' | sed -e 's/+$//' | bc -l)
  echo "$dirsize $dir"
done <<< "$(find . -type d)" | sort -nr | while read dir; do
  size=$(echo $dir | awk '{print $1}')
  if [[ $size -lt $space_needed ]]; then
    echo "part 2: $last_dir"
    exit;
  fi
  last_dir=$dir
done
