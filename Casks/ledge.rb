cask "ledge" do
  version "1.5.0"
  sha256 "9a2cd0e58061ca3845eb48405062c9daf84ed0c118a6948cbaf983f311278940"

  url "https://github.com/NeeL21YT/Ledge/releases/download/v#{version}/Ledge-#{version}.dmg"
  name "Ledge"
  desc "Menu-bar file shelf for macOS with a built-in image converter"
  homepage "https://github.com/NeeL21YT/Ledge"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Ledge.app"

  # Ledge is ad-hoc signed, not notarized, so Gatekeeper would block the first launch.
  # Remove this block once the app is signed with a Developer ID and notarized.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Ledge.app"]
  end

  zap trash: [
    "~/Library/Caches/Ledge",
    "~/Library/Preferences/app.ledge.mac.plist",
  ]
end
