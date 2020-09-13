#!/bin/bash

# sed stream editor
# -i save changes in-place aka in the original file
# s/ substitution
# syntax "s/string_to_search_for/string_to_replace_with/"
# g for global search

sed -i "s/autoindex off;/autoindex on;/g" /etc/nginx/sites-available/localhost
service nginx restart
echo "autoindex is enabled"
