cask "deskpet" do
  version "0.8"
  sha256 "52a995bdccce18f26703ca2cd513ada323a42c97cb6c6303fb28d2c52d902d15"

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
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DeskPet.app"],
                          writable_paths: ["DeskPet.app"], writable_base: :appdir
  end

  uninstall quit: "it.diluzio.deskpet"

  zap trash: "~/Library/Application Support/DeskPet"
end
