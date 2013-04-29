#!/usr/bin/perl -w
use strict;
use warnings;
use Tkx;
Tkx::package_require('img::png');

my $png_image_file = 'd:\\workspace\\captureSnipping\\S13_mini.gif';

my $mw = Tkx::widget->new(".");

Tkx::image_create_photo('pic', -file => $png_image_file);
my $btn = $mw->new_ttk__button(
    -text => "Button mit PNG-Datei als Bild",
    -compound => 'top',
    -image => 'pic',
);
$btn->g_pack(-padx => 10, -pady => 100,);

Tkx::MainLoop();
exit(0);