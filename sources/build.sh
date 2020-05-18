<<<<<<< HEAD
# source venv/bin/activate

mkdir -p ../fonts ../fonts/ttf ../fonts/otf ../fonts/variable

# Generating TTFs
fontmake -g SpaceGrotesk.glyphs -i -o ttf --output-dir ../fonts/ttf/

# Post processing TTFs
ttfs=$(ls ../fonts/ttf/*.ttf)
for ttf in $ttfs
do
	ttfautohint $ttf "$ttf.fix";
	mv "$ttf.fix" $ttf;

    gftools fix-hinting $ttf;
    mv "$ttf.fix" $ttf;

    gftools fix-dsig -f $ttf;
done

# Generating OTFs
fontmake -g SpaceGrotesk.glyphs -i -o otf --output-dir ../fonts/otf/

# Post processing OTFs
otfs=$(ls ../fonts/otf/*.otf)
for otf in $otfs
do
    gftools fix-dsig -f $otf;
done

# Generating VFs
VF_FILE=../fonts/variable/SpaceGrotesk\[wght]\.ttf
fontmake -g SpaceGrotesk.glyphs -o variable --output-path $VF_FILE

rm -rf master_ufo/ instance_ufo/

# Post processing VFs
ttfautohint $VF_FILE $VF_FILE.fix
mv $VF_FILE.fix $VF_FILE

gftools fix-hinting $VF_FILE
mv $VF_FILE.fix $VF_FILE

gftools fix-dsig -f $VF_FILE

gftools fix-unwanted-tables $VF_FILE -t MVAR
=======
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
fontmake -g "SpaceGrotesk-v2.glyphs" -o variable --output-path ../fonts/ttf/SpaceGrotesk\[wght\].ttf
#statmake --stylespace ./stat.stylespace --designspace master_ufo/SpaceGrotesk.designspace ../fonts/ttf/SpaceGrotesk\[wght\].ttf

rm -rf master_ufo/ instance_ufo/

echo "Post processing"

mkdir -p ../fonts/woff2

ttfs=$(ls ../fonts/ttf/static/*.ttf)
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;
	ttfautohint $ttf $ttf.fix
	mv "$ttf.fix" $ttf
	gftools fix-hinting $ttf
	mv "$ttf.fix" $ttf
	cp $ttf ../fonts/woff2
done

vfs=$(ls ../fonts/ttf/*.ttf)
for vf in $vfs
do
	gftools fix-dsig -f $vf;
	gftools fix-nonhinting $vf "$vf.fix"
	mv "$vf.fix" $vf
	gftools fix-unwanted-tables --tables MVAR $vf
	cp $vf ../fonts/woff2
done
rm ../fonts/ttf/*backup*.ttf

ttfs=$(ls ../fonts/woff2/*.ttf)
for ttf in $ttfs
do
	woff2_compress $ttf
done
rm ../fonts/woff2/*.ttf

echo "Voila! Done."
cd ..
>>>>>>> 92cca2b44655135c120eb4e9c851f5969f469cd1
