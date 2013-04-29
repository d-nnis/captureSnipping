#!/usr/bin/perl -w
use strict;
use warnings;
use Tkx;
Tkx::package_require('img::png');

my $png_image_file = 'd:\\workspace\\captureSnipping\\S13_mini.gif';

my $mw = Tkx::widget->new(".");
$mw->g_wm_title("captureSnipping");

Tkx::image_create_photo('pic', -file => $png_image_file);
my $frame = $mw->new_ttk__frame(-image => 'pic');
#$frame->configure(-padding => "5 10");
#$frame->configure(-borderwidth => 2, -relief => "sunken");
my $label = $mw->new_ttk__label(-text => "Full name:");
$label->configure(-image => 'pic');

my $btn = $mw->new_ttk__button(
    -text => "Button mit PNG-Datei als Bild",
    -compound => 'top',
    -image => 'pic',
);
$btn->g_pack(-padx => 10, -pady => 10,);

Tkx::MainLoop();
exit(0);