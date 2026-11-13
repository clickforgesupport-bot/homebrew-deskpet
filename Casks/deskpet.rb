cask "deskpet" do
  version "0.5"
  sha256 "6c0955cc7e676ce760485e5132d56e26becc3970c039ea196ddf88a869c30399"

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

  depends_on macos: :sonoma

  app "DeskPet.app"

  # L'app non è notarizzata: senza questo macOS la bloccherebbe al primo avvio.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/DeskPet.app"]
  end

  uninstall quit: "it.diluzio.deskpet"

  zap trash: "~/Library/Application Support/DeskPet"
end
