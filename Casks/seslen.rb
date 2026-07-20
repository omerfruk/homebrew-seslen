# Seslen Homebrew Cask'ı.
#
# Bu dosya `omerfruk/homebrew-seslen` deposundaki `Casks/seslen.rb` yoluna
# konur. Kullanıcı şu komutlarla kurar:
#
#   brew tap omerfruk/seslen
#   brew install --cask --no-quarantine seslen
#
# NEDEN `--no-quarantine`: Uygulama Apple Developer sertifikasıyla
# imzalanmadığı için macOS karantina bayrağını koyar ve açılışta "hasarlı"
# uyarısı verir. Bunu cask içinden `postflight` ile temizlemek mümkün ama o
# zaman cask "kod çalıştıran" sayılıp her kullanıcıdan `brew trust` onayı
# ister. Homebrew'un kendi bayrağını kullanmak hem daha az sürtünmeli hem de
# ne olduğu kullanıcıya açık.
#
# SÜRÜM ÇIKARIRKEN: `version` ve `sha256` alanları güncellenmelidir.
# `make dmg` komutu DMG'nin SHA256 özetini ekrana yazar.
cask "seslen" do
  version "0.1.0"
  sha256 "798fcae59ecacb7eb8749939f3e9ff58ce72342f526f1baac411d2ddf68e6f45"

  url "https://github.com/omerfruk/seslen/releases/download/v#{version}/Seslen-#{version}.dmg"
  name "Seslen"
  desc "Kulaklıkla çalışan ekipler için sessiz seslenme uygulaması"
  homepage "https://github.com/omerfruk/seslen"

  depends_on macos: ">= :sonoma"

  app "Seslen.app"

  uninstall quit: "com.omerfruk.seslen"

  zap trash: [
    "~/Library/Preferences/com.omerfruk.seslen.plist",
    "~/Library/Caches/com.omerfruk.seslen",
  ]

  caveats <<~METIN
    Seslen menü çubuğunda çalışır; Dock'ta simgesi görünmez.

    İlk açılışta bir sunucu adresi girmeniz gerekir. Ekibinizin yöneticisi
    size sunucu adresini ve 6 haneli katılım kodunu verecektir.

    Uygulama Apple Developer sertifikasıyla imzalanmadığı için, kurarken
    --no-quarantine kullanmadıysanız macOS "hasarlı" diyebilir. O durumda:

      xattr -dr com.apple.quarantine /Applications/Seslen.app

    ya da: Sistem Ayarları → Gizlilik ve Güvenlik → "Yine de Aç"
  METIN
end
