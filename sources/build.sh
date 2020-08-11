#!/bin/sh
set -e

mkdir -p ../fonts/otf ../fonts/ttf ../fonts/ttf/static ../fonts/woff2 ../fonts/woff2/static


echo "Generating VFs"
VF_File=../fonts/ttf/SpaceGrotesk\[wght\].ttf
glyphs2ufo SpaceGrotesk-v2.glyphs --generate-GDEF
fontmake -m SpaceGrotesk.designspace -o variable --output-path $VF_File

echo "Post processing VFs"
    gftools fix-nonhinting $VF_File $VF_File.fix
    mv $VF_File.fix $VF_File
    gftools fix-dsig -f $VF_File
    gftools fix-unwanted-tables $VF_File -t MVAR
    python3 spaceG_stat_table.py $VF_File
	fonttools ttLib.woff2 compress $VF_File

echo "Generating static TTFs"
fontmake -m SpaceGrotesk.designspace -i -o ttf --output-dir ../fonts/ttf/static/ -a

echo "Post processing static TTFs"
ttfs=$(ls ../fonts/ttf/static/*.ttf)
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;
	gftools fix-hinting $ttf
	mv "$ttf.fix" $ttf
	fonttools ttLib.woff2 compress $ttf
done

echo "Generating static OTFs"
fontmake -m SpaceGrotesk.designspace -i -o otf --output-dir ../fonts/otf/ -a

echo "Post processing static OTFs"
otf=$(ls ../fonts/otf/*.otf)
for otf in $otf
do
	gftools fix-dsig -f $otf
done

echo "Woff2 static and vf"

mv ../fonts/ttf/*.woff2 ../fonts/woff2
mv ../fonts/ttf/static/*.woff2 ../fonts/woff2/static

rm -rf master_ufo/ instance_ufo/ ../fonts/ttf/*backup*.ttf *.ufo ../instance_ufo SpaceGrotesk-v2.designspace

echo "Voila! Done."
cd ..
