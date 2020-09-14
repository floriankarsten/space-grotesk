# Space Grotesk 2.0
[Space Grotesk](https://floriankarsten.github.io/space-grotesk/) is a proportional sans-serif typeface variant based on [Colophon Foundry's](https://www.colophon-foundry.org) fixed-width [Space Mono](https://github.com/googlefonts/spacemono) family (2016). Originally designed by [Florian Karsten](https://fonts.floriankarsten.com) in 2018, Space Grotesk retains the monospace's idiosyncratic details while optimizing for improved readability at non-display sizes.

Space Grotesk includes Latin Vietnamese, Pinyin, and all Western, Central, and South-Eastern European language support, as well as several OpenType features (old-style and tabular figures, superscript and subscript numerals, fractions, stylistic alternates).

## Building the Fonts

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

Florian Karsten Studio (Brno, Czech Republic) focuses on graphic design, type design and programming. We create websites, books, programmes, typefaces and above all, functional systems. We're excited about open-source and peer2peer networks.

Questions, comments, requests, suggestions: fonts@floriankarsten.com