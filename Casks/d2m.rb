require 'json'
require 'net/http'

cask "d2m" do
  desc "d2m - CLI tool to view Dota2 scheduled matches"
  homepage "https://github.com/vuon9/d2m"

  # Fetch the latest release version from GitHub
  release_url = "https://github.com/vuon9/d2m/releases"
  latest_url = "#{release_url}/latest"
  response = Net::HTTP.get_response(URI.parse(latest_url))
  latest_url = response['location']
  odie "Cannot find the latest version" if (latest_url.nil?)
  latest_release = latest_url.delete_prefix("#{release_url}/tag/")

  version latest_release

  # e.g: d2m-v1.3.1-darwin-amd64.tar.gz
  base_url = "#{release_url}/download/#{latest_release}/d2m-#{latest_release}-darwin"
  file_extension = Hardware::CPU.arm? ? "-arm64.tar.gz" : "-amd64.tar.gz"

  url "#{base_url}#{file_extension}"

  # TODO checksum
  sha256 :no_check

  # Decompress and copy to Homebrew user bin folder
  bin_path = "/usr/local/bin/d2m2"
  tarball_path = "#{HOMEBREW_CACHE}/d2m.tar.gz"

  system "tar -xzf #{tarball_path} -C #{HOMEBREW_CACHE}"
  system "mv #{HOMEBREW_CACHE}/d2m #{bin_path}"

  postflight do
    print("Downloaded and installed d2m version #{latest_release} to #{bin_path}")
    print("You can now run `d2m` from the terminal")

  end

  auto_updates true
end
