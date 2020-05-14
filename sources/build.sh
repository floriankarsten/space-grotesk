#!/bin/sh
set -e

echo "Generating Static OTFs"
mkdir -p ../fonts/otf
fontmake -g "SpaceGrotesk-v2.glyphs" -i -o otf --output-dir ../fonts/otf/

echo "Generating Static TTFs"
mkdir -p ../fonts/ttf/static
fontmake -g "SpaceGrotesk-v2.glyphs" -i -o ttf --output-dir ../fonts/ttf/static/

echo "Generating VFs"
mkdir -p ../fonts/ttf
fontmake -g "SpaceGrotesk-v2.glyphs" -o variable --output-path ../fonts/ttf/SpaceGrotesk[wght].ttf

rm -rf master_ufo/ instance_ufo/

echo "Post processing"

ttfs=$(ls ../fonts/ttf/static/*.ttf)
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;
	ttfautohint $ttf $ttf.fix;
	mv "$ttf.fix" $ttf;
	gftools fix-hinting $ttf;
	mv "$ttf.fix" $ttf;
done

vfs=$(ls ../fonts/ttf/*.ttf)
for vf in $vfs
do
	gftools fix-dsig -f $vf;
	gftools fix-nonhinting $vf "$vf.fix";
	mv "$vf.fix" $vf;
	gftools fix-unwanted-tables --tables MVAR $vf;
done
rm ../fonts/ttf/*backup*.ttf

echo "Voila! Done."

cd ..