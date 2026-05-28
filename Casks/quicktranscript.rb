cask "quicktranscript" do
  version "0.1.3"
  sha256 "1b5cecba9f225d221a76f0635ffc056eef2d3835594f164c5e30653788add055"

  url "https://github.com/rohitjavvadi/quicktranscript/releases/download/v#{version}/QuickTranscript.app.zip"
  name "QuickTranscript"
  desc "Local macOS meeting transcription with MLX Whisper"
  homepage "https://github.com/rohitjavvadi/quicktranscript"

  depends_on macos: ">= :ventura"

  app "QuickTranscript.app"

  postflight do
    system_command "#{appdir}/QuickTranscript.app/Contents/Resources/setup_runtime.sh",
                   sudo: false
  end

  caveats do
    <<~EOS
      QuickTranscript records microphone audio and stores transcripts in:
        ~/Desktop/MeetingTranscripts

      The first install downloads the local MLX Whisper runtime into:
        ~/Library/Application Support/QuickTranscript/.venv
    EOS
  end

  zap trash: [
    "~/Desktop/MeetingTranscripts",
    "~/Library/Application Support/QuickTranscript",
  ]
end
