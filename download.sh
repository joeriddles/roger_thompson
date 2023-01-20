#!/bin/bash
set -e

# Download best mp4 format available or any other best if no mp4 available
format='bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
output='./videos/%(title)s.%(ext)s'

# Download using the playlist
yt-dlp \
  --batch-file playlist.txt \
  --output $output \
  --yes-playlist \
  --format $format \
  --write-description \
  --write-thumbnail \
  --convert-thumbnails jpg

# Download using individual video links
# yt-dlp \
#   --batch-file videos.txt \
#   --output $output \
#   --format $format \
#   --write-description \
#   --write-thumbnail

# Convert .webp cover images to .jpg if using youtube-dl
# for img_path in ./videos/*.webp; do
#   magick "$img_path" "${img_path%.webp}.jpg"
#   rm "$img_path"
# done
