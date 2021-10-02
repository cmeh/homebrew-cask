cask "sage" do
  version "9.4,1.2.1"
  sha256 "aef17ce5ceb2a33719684b0c188fec495fc8674e10daf4fa162874de871ac575"

  url "https://github.com/3-manifolds/Sage_macOS/releases/download/v#{version.after_comma}/SageMath-#{version.before_comma}.dmg",
      verified: "github.com/3-manifolds/Sage_macOS/"
  name "Sage"
  desc "Mathematics software system"
  homepage "https://www.sagemath.org/"

  livecheck do
    url "https://github.com/3-manifolds/Sage_macOS/releases/latest"
    strategy :page_match do |page|
      match = page.match(%r{href=.*?/v?(\d+(?:\.\d+)*)/SageMath-(\d+(?:\.\d+)*)\.dmg}i)
      "#{match[2]},#{match[1]}"
    end
  end

  depends_on macos: ">= :high_sierra"

  app "SageMath-#{version.before_comma.dots_to_hyphens}.app"
  pkg "Recommended_#{version.before_comma.dots_to_underscores}.pkg"

  uninstall quit:    [
    "org.computop.sage",
    "org.computop.SageMath",
    "com.tcltk.tcllibrary",
    "com.tcltk.tklibrary",
  ],
            pkgutil: [
              "org.computop.SageMath.#{version.before_comma.dots_to_underscores}.bin",
              "org.computop.SageMath.#{version.before_comma.dots_to_underscores}.share",
              "org.computop.SageMath.#{version.before_comma.dots_to_underscores}.texlive",
            ]

  zap trash: [
    "~/.sage",
    "~/Library/Application Support/SageMath",
    "~/Library/Preferences/SageMath.plist",
  ]
end
