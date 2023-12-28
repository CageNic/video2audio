for file in *.m4a; do fname=$(basename "$file" .m4a); ffmpeg -i "$file" -vn -acodec copy "$fname".aac; done
