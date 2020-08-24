# Space Grotesk 2.0

[Space Grotesk](https://floriankarsten.github.io/space-grotesk/) is a sans-serif typeface and a proportional variant of the original fixed-width [Space Mono](https://github.com/googlefonts/spacemono) family. Designed by [Florian Karsten](https://fonts.floriankarsten.com) in 2018, Space Grotesk retains [Colophon's Foundry](https://www.colophon-foundry.org) Space Mono quirkiness and personality but was optimised for better readability at non-display sizes.

Since its initial release in 2018, Space Grotesk was later heavily reworked and completed with previously missing or suppressed Space Mono design features for 2020 Google Fonts release.

Space Grotesk supports Google Fonts [Latin Plus](https://github.com/googlefonts/gftools/tree/master/Lib/gftools/encodings/GF%20Glyph%20Sets) character set, as well as several OpenType features (old-style and tabular figures, superscript and subscript numerals, fractions, stylistic alternates).

## Build

Family is built using fontmake and gftools post processing script. Tools are all python based.

To install all the Python tools into a virtualenv, do the following:

```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Then run the build script in the terminal:

```
cd sources
sh build.sh
```

## License

Space Grotesk is licensed under the SIL Open Font License v1.1, see [OFL.txt](OFL.txt) for details.

## About Author

Florian Karsten Studio (Brno, Czech Republic) focuses on graphic design, type design and programming. We create websites, books, programmes, typefaces and above all, functional systems. We’re excited about open-source and peer2peer networks.

Questions, comments, requests, suggestions: fonts@floriankarsten.com