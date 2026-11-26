cask "pomotide" do
  version "0.2.3"
  sha256 "ffe3a7bbb27f76b3104a2cfdb59566f0b3052748fac3f648f5ee8b7cca94d05f"

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
