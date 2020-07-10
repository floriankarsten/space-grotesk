#!/bin/sh
set -e

mkdir -p ../fonts/ttf ../fonts/otf ../fonts/ttf/static ../fonts/woff2


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

echo "Generating Static TTFs"
fontmake -m SpaceGrotesk.designspace -i -o ttf --output-dir ../fonts/ttf/static/ -a

echo "Post processing Static TTFs"
ttfs=$(ls ../fonts/ttf/static/*.ttf)
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;
	gftools fix-hinting $ttf
	mv "$ttf.fix" $ttf
	cp $ttf ../fonts/woff2
done

echo "Generating Static OTFs"
# fontmake -g "SpaceGrotesk-v2.glyphs" -i -o otf --output-dir ../fonts/otf/ -a
fontmake -m SpaceGrotesk.designspace -i -o otf --output-dir ../fonts/otf/static/ -a

echo "Post processing Static OTF"
otf=$(ls ../fonts/otf/*.otf)
for otf in $otf
do
	gftools fix-dsig -f $otf
done

rm -rf master_ufo/ instance_ufo/ ../fonts/ttf/*backup*.ttf *.ufo

echo "Post processing Static Woff2"
ttfs=$(ls ../fonts/woff2/*.ttf)
for ttf in $ttfs
do
	woff2_compress $ttf
done
rm ../fonts/woff2/*.ttf

echo "Voila! Done."
cd ..
