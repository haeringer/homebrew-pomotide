cask "pomotide" do
  version "0.1.3"
  sha256 "abce7b7a4416418bb5c6de860fd539db362a0f0247d2d170eb913d60aaf1e10f"

  url "https://github.com/haeringer/pomotide/releases/download/v#{version}/PomoTide-#{version}.zip"
  name "PomoTide"
  desc "Menu bar Pomodoro timer with Do Not Disturb and Apple Music"
  homepage "https://github.com/haeringer/pomotide"

  depends_on macos: :tahoe

  app "PomoTide.app"

  # PomoTide is ad-hoc signed, not notarized; without this, Gatekeeper blocks the first start.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/PomoTide.app"]
  end

  uninstall quit: "io.github.haeringer.pomotide"

  zap trash: "~/Library/Preferences/io.github.haeringer.pomotide.plist"
end
