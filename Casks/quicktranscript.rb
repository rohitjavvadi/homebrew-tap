cask "quicktranscript" do
  version "0.1.0"
  sha256 "60dc748f7ce0457cb431a7e3ee4ffabb7ca82f8a1ffa6a2316214d5700bfe049"

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
