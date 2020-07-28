#FK FONT BUILDER v1.0.1
#!/bin/sh
set -e

echo "Generating VFs"
fontmake -g SG-OpenType.glyphs -o variable --output-path SG-OpenType.ttf
fontmake -g SG-Linear.glyphs -o variable --output-path SG-Linear.ttf
fontmake -g SG-Transition.glyphs -o variable --output-path SG-Transition.ttf

rm -rf master_ufo/ instance_ufo/

echo "Post processing"

vfs=$(ls *.ttf)
for vf in $vfs
do
	gftools fix-dsig -f $vf;
	gftools fix-nonhinting $vf "$vf.fix"
	mv "$vf.fix" $vf
	gftools fix-unwanted-tables --tables MVAR $vf
	woff2_compress $vf
	sfnt2woff $vf
done

rm *.ttf

mv *.woff2 ../../assets/fonts
mv *.woff ../../assets/fonts

echo "Voila! Done."
cd ..