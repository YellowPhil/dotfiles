#!/bin/bash

echo "(box" 
for ((i = 0; i < 2; ++i)); do
    item_content=$(copyq read $i)
    echo "
    (box
        (label 
            :wrap true
            :text $item_content
        )
    )"
done
echo ")"