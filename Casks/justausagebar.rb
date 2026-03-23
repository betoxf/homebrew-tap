cask "justausagebar" do
  version "1.1.0"
  sha256 "48d76de3b7e85c6b3186dc8ec429f4f398a32580042d7949c8ab542168530f28"

  url "https://github.com/betoxf/JustaUsageBar/releases/download/v#{version}/JustaUsageBar.zip"
  name "Just A Usage Bar"
  desc "Menu bar app showing Claude and Codex usage statistics"
  homepage "https://github.com/betoxf/JustaUsageBar"

  depends_on macos: ">= :sonoma"

  app "JustaUsageBar.app"

  postflight do
    # Remove quarantine flag so Gatekeeper doesn't block the unsigned app
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/JustaUsageBar.app"]
    # Launch the app immediately after install
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/JustaUsageBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/JustaUsageBar",
    "~/Library/Preferences/bullfigherstudios.JustaUsageBar.plist",
    "~/Library/Caches/bullfigherstudios.JustaUsageBar",
  ]
end
