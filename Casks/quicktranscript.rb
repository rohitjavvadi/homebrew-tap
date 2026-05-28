cask "quicktranscript" do
  version "0.1.1"
  sha256 "62bb6b272a000d5eab6e985f6a15c04eb27fc3fcc39f09e23df65209d85555ef"

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
