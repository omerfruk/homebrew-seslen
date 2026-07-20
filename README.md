# Seslen için Homebrew tap'i

Kulaklıkla çalışan ekipler için sessiz seslenme uygulaması.

## Kurulum

```bash
brew tap omerfruk/seslen
brew trust omerfruk/seslen
brew install --cask seslen
```

> `brew trust` adımı Homebrew 6.0 ile geldi: resmi olmayan tüm tap'ler için
> bir kereye mahsus onay isteniyor. Atlarsanız kurulum "untrusted tap"
> hatası verir.

## Güncelleme

```bash
brew update && brew upgrade --cask seslen
```

## Kaldırma

```bash
brew uninstall --cask seslen
```

Projenin kendisi: https://github.com/omerfruk/seslen
