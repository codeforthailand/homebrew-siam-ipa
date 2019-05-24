# SIAM IPA, A homebrew tap for Thais!

## Setup
In order to use this tap, you need to have [Homebrew][1] installed as well as Homebrew's [Cask][2]. If you already have Homebrew, you can simply install Cask via 
```
$ brew install cask
```

If you already have those two packages, you just need to tap the repository
```
$ brew tap codeforthailand/siam-ipa
```

And available formulas can be installed using the command template below:
```
$ brew cask install <NAME>
```

## Available Formulae and Casks
1. [Thai-Eng Dictionary by Infinisoft and NECTEC][thai-dict] (name=`thai-dict`)
2. Thai Font Collections

   1. [13 Thai National Fonts by SIPA][sipa-font] (name=`font-collection-sipa`)

        [Preview](https://github.com/lannainnovation/thai-font-collection/tree/master/downloadable-free-thai-fonts#dip-sipa)

   2. [Popular Fonts from f0nt.com][f0nt] (name=`font-collection-f0nt`)

        WIP. [Preview](https://docs.google.com/spreadsheets/d/1RWFD0wnx_m7IqUQ3KFfTtztXdsG3q0Fhnz7LN7A31rc/edit?usp=sharing)

   3. [Cadson Demak](https://github.com/cadsondemak)(name=`font-collection-cadson-demak`)

        [Preview](https://github.com/lannainnovation/thai-font-collection/tree/master/downloadable-free-thai-fonts#cadson-demak)

   4. [NECTEC ✕ Thai Linux Working Group](https://www.nectec.or.th/pub/review-software/font/national-fonts.html)(name=`font-collection-nectec-tlwg`)

        [Preview](https://github.com/lannainnovation/thai-font-collection/tree/master/downloadable-free-thai-fonts#nectec-national-fonts)

   5. [TEPC](https://github.com/lannainnovation/thai-font-collection/tree/master/downloadable-free-thai-fonts#thai-electronic-publishing-club-tepc)(name=`font-collection-tepc`)

        [Preview](https://github.com/lannainnovation/thai-font-collection/tree/master/downloadable-free-thai-fonts#thai-electronic-publishing-club-tepc)

   6. [JS-Technology](https://github.com/lannainnovation/thai-font-collection/tree/master/downloadable-free-thai-fonts#js-technology)(name=`font-collection-js-technology`)

        [Preview](https://github.com/lannainnovation/thai-font-collection/tree/master/downloadable-free-thai-fonts#js-technology)


4. SWATH (WIP)

## Contributions
If you see any macOS packages or applications that are developed for Thai people, please let us know or consider making PRs for them. We're more than happy to recieve your PRs.

## Acknowledgements
- Thanks @lannainnovation for assembling [the list of Thai font collections][thai-collection].

[1]: https://brew.sh
[2]: https://github.com/Homebrew/homebrew-cask
[thai-dict]: https://www.macthai.com/2015/11/05/install-dictionary-th-en-on-mac-osx/
[sipa-font]: https://www.nstda.or.th/th/news/12102-thai-font
[f0nt]: https://www.f0nt.com
[thai-collection]: https://github.com/lannainnovation/thai-font-collection
