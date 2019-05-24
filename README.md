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

## Available Formulae and Casks
1. [Thai-Eng Dictionary by Infinisoft and NECTEC][thai-dict]
    ```
    $ brew cask install thai-dict
    ```
2. Thai Font Collections
    These font collections can be installed using the following command:
    ```
    $ brew cask install font-collection-<NAME>
    ```
   1. [13 Thai National Fonts by SIPA][sipa-font] (name=`sipa`)

    some description

   2. [Popular Fonts from f0nt.com][f0nt] (name=`f0nt`)

    some description

3. SWATH (WIP)

## Contributions
If you see any macOS packages or applications that are developed for Thai people, please let us know or consider making PRs for them. We're more than happy to recieve your PRs.


[1]: https://brew.sh
[2]: https://github.com/Homebrew/homebrew-cask
[thai-dict]: https://www.macthai.com/2015/11/05/install-dictionary-th-en-on-mac-osx/
[sipa-font]: https://www.nstda.or.th/th/news/12102-thai-font
[f0nt]: https://www.f0nt.com
