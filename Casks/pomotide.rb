cask "pomotide" do
  version "0.1.2"
  sha256 "ba03895b3883df2c3bcfee9d4f3df193ce84218275a478f138c3b559c7cc3432"

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
