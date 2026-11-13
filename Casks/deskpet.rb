cask "deskpet" do
  version "0.4"
  sha256 "23c03eb20b6d7d16a36903df6aec6b9624617031237532097fcdf1f4ef3e1e10"

  url "https://deskpet-dev.clickforge.workers.dev/DeskPet-#{version}.zip"
  name "DeskPet"
  desc "Cucciolo da accudire che vive sul Dock del Mac"
  homepage "https://deskpet-dev.clickforge.workers.dev/download"

  livecheck do
    url "https://deskpet-dev.clickforge.workers.dev/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :sonoma"

  app "DeskPet.app"

  # L'app non è notarizzata: senza questo macOS la bloccherebbe al primo avvio.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/DeskPet.app"]
  end

  uninstall quit: "it.diluzio.deskpet"

  zap trash: "~/Library/Application Support/DeskPet"
end
