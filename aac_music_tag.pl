# tag music from yt
# use yt-dl -f 140 to get .m4a extension with .aac encoding
# downloaded format is artist-track-1234abcd.m4a
# output format is artist track.aac

#!/usr/bin/perl
use strict;
use warnings;
use MP3::Info;
use File::Copy;
use feature 'say';

# directory is working directory

my $dir = '.';
my $new_dir = './copied_tracks_for_tagging';
mkdir $new_dir unless -d $new_dir;
opendir (my $dh, $dir) or die "Could not open '$dir' for reading '$!'\n";
while (my $music = readdir $dh) {
  if ($music eq '.' or $music eq '..' or $music !~ /\.m4a$/) {
  next;
}
copy ($music, "$new_dir/$music");
}
closedir $dh;

chdir $new_dir;

my @arr = glob "*.m4a";
foreach my $track (@arr) { 
  my @array = split (/\s?-\s?/,$track);
  say $array[0];
  say $array[1];
  my $new_music = "$array[0] $array[1]";
  my $tag = get_mp3tag ($new_music);
  $tag->{ARTIST} = $array[0];
  $tag->{TITLE}  = $array[1];
  move ($track, $new_music.".aac");
  set_mp3tag($new_music, $tag);
}
exit;
