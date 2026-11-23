cask "pomotide" do
  version "0.1.1"
  sha256 "190a8fa189c60663a314fcb6901146f81d2209f18818f33049742100be800f9a"

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
