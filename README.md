# arthur-debert Homebrew-Tools

## How do I install these formulae?

`brew install arthur-debert/homebrew-tools/<formula>`

Or `brew tap arthur-debert/homebrew-tools` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "arthur-debert/homebrew-tools"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Astrophotography on macOS

GraXpert and ASTAP CLI use upstream binaries for Apple Silicon and Intel Macs:

```sh
brew install arthur-debert/tools/graxpert arthur-debert/tools/astap-cli
graxpert --version
astap_cli -h
```

`graxpert` opens the GUI without arguments and supports upstream CLI options.
The app bundle is at `$(brew --prefix graxpert)/GraXpert.app`; `brew info graxpert`
shows how to add it to Finder. GraXpert downloads AI models on first use.
Homebrew installs 7-Zip as a build dependency when installing GraXpert from its
upstream DMG, so extraction works inside Homebrew's build sandbox.

ASTAP installs `astap_cli` and the alias `astap-cli`, with executable permissions
and ad-hoc code signing applied automatically. Plate solving also needs a
[star database](https://www.hnsky.org/astap.htm):

```sh
astap_cli -f image.fits -d /path/to/database
```

### Updating the formulas

Run these scripts from a checkout with Python 3 and curl installed. GraXpert's
updater also requires an authenticated `gh` CLI.

```sh
scripts/update-graexpert                 # Latest stable Dark-Matters-Astro release
scripts/update-graexpert --version 4.0.0.rc1
scripts/update-astap                     # Current official SourceForge Mac CLI
scripts/update-astap --archive 2025.07.16 # Older SourceForge filename date
```

Both scripts download both Mac architectures, compute SHA-256 checksums, and
update the formula after all downloads pass validation. Add `--dry-run` to
print changes without writing. GraXpert checks GitHub's asset digests when
available. ASTAP checks each binary's architecture and embedded CLI version;
this can differ from the download's date and the GUI version.

The ASTAP download URLs on SourceForge can be replaced upstream. A checksum
failure requires rerunning the updater and reviewing the downloaded version.
Published Homebrew bottles retain the binaries for their specific version.
Updaters remove obsolete bottle checksums when changing a formula.

After reviewing and pushing the formula changes, update the installed tap and
test installation with `brew update`, `brew upgrade <formula>`, and
`brew test arthur-debert/tools/<formula>`.

### Publishing bottles

Build and test on each supported macOS/CPU combination. For example:

```sh
brew uninstall arthur-debert/tools/astap-cli # If already installed
brew install --build-bottle arthur-debert/tools/astap-cli
brew postinstall arthur-debert/tools/astap-cli
brew test arthur-debert/tools/astap-cli
brew bottle --json --root-url=https://github.com/arthur-debert/homebrew-tools/releases/download/astap-cli-2026.09.01 arthur-debert/tools/astap-cli
```

Upload the bottle archive to that GitHub release, merge its JSON with
`brew bottle --merge --write --no-commit <bottle.json>`, then commit and push the
formula's bottle checksums. Repeat for `graxpert` with its own versioned release.
For additional architectures, merge all their JSON files together.
