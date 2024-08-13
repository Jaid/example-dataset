$inputFile =  'private/video.mp4'

$timestamps = @(
  1460.96
  1700.657
  1701.408
  1714.129
  2129.169
  2605.0609999999997
  2609.982
  2621.661
  2636.0499999999997
  2652.1079999999997
  2932.93
  3062.643
  3062.977
  3093.424
  3244.074
  3483.5629999999996
  4182.178
  4319.065
  4550.420999999999
)

$i = 0
foreach ($timestamp in $timestamps) {
  $i++
  $imageExists = Test-Path src/$i`.png
  if (!$imageExists) {
    ffmpeg -ss $timestamp -i $inputFile -frames:v 1 -f image2pipe -vcodec png - | magick - -fuzz 5% -trim +fuzz -gravity Center -extent 1:1 -define png:compression-level=9 src/$i`.png
  }
  $captionExists = Test-Path src/$i`.txt
  if (!$captionExists) {
    Write-Output '1boy, huibuh' > src/$i`.txt
  }
}
