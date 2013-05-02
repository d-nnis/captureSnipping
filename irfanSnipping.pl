use warnings;
use strict;
use irfanview_automate;


#### irfanSnipping.pl
## in: i:\projekte\vera6 2012\int_THPage\VL001_4\identif\S000181.tif
## out: i:\projekte\vera6 2012\toSAP\Bildd\S000181_VL001_1_09a.jpg
##  zuvor 5OE51106_VL00109a.JPG

#### config ####
my %config = File::readfile("config_v6.csv", 'config');
###

my $irfan = Irfan->new();
$irfan->option(wait=>10);
select(undef, undef, undef, 0.2);
# get crop-details from ifranView-instance
# Window-Title: scp_dilate82012-10-18_135254.jpg - IrfanView (Selection: 411, 176; 159 x 114; 1.395)
#("S000181.tif", 411, 176, 159, 114, 1.395)
(my $imageFile, my $X, my$Y, my $dimX, my $dimY, my $noPixels) = $irfan->get_crop();



my @sqlline;

# Abfrage: $seiteDef, $item
# weiteres item auf $seiteDef?
#my $line = $seiteDef, $item, $X, $Y, $dimX, $dimY, $noPixel;
#push @sqlline, $line;

# Beenden?

# write to file
# INSERT INTO dennis.SAP_items_crop ($item) VALUES
File::writefile($config{dir}.'SAP_items_crop.sql', @sqlline);

#execute file?

##################
## batchSnipping


# files from [project_dir]\int_THPage\VL008_1
# check against files in SAP.Bild
my @batchline;
my $line;

push @batchline, $line;

# $db->getSeiteDef from dennis.SAP_items_crop
# aus jeder seitendefinition in dennis.SAP_items_crop
#foreach my $seiteDef (@seiteDef_db) {
	# $seiteDef eq VL001_1
	# @files = subdirs of [project_dir]\int_THPage\$seiteDef, get_by_ext
	
	#foreach my $file (@files) {
		# my $filestem = Data::get_fname $file;
		#my $line  = $config{iview} $file . '/crop=('.$x.','.$y.','.$dimX.','.$dimY.') /convert '.$filestem.'_'.$seiteDef.'_'.$item'.'.jpg';
		# out: [project_dir]\toSAP\Bildd\S000181_VL001_1_09a.jpg
		#"c:\Program Files (x86)\IrfanView\i_view32.exe" S13.tif /crop=(10,10,300,300) /convert 13_irfCrop.tif
		#(AnfangX, AnfangY, DimensionX, DimensionY)
		
		#push @batchline, $line;
		
	#}
#}


File::writefile($config{dir}.'convert_Bild_Ausschnitte.bat', @batchline);

## sample-output
# Modul essent.pm
# found window 1900768
# Window-Title:scp_dilate82012-10-18_135254.jpg - IrfanView (Selection: 411, 176; 159 x 114; 1.395)
##
