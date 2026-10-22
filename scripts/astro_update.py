import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parent.parent


def download(url, destination):
    subprocess.run(
        ["curl", "--fail", "--location", "--retry", "3", "--silent", "--show-error",
         "--output", str(destination), url], check=True,
    )
    return hashlib.sha256(destination.read_bytes()).hexdigest()


def github_release(repository, tag=None):
    endpoint = f"repos/{repository}/releases/"
    endpoint += f"tags/{tag}" if tag else "latest"
    return json.loads(subprocess.check_output(["gh", "api", endpoint], text=True))


def update_formula(name, version, assets, dry_run=False):
    path = ROOT / "Formula" / f"{name}.rb"
    original = path.read_text()
    result, count = re.subn(r'^  version ".*"$', f'  version "{version}"', original, flags=re.M)
    if count != 1:
        raise ValueError(f"Expected one version in {path}")
    for arch, (url, sha256) in assets.items():
        pattern = rf'(    on_{arch} do\n)      url "[^"\n]+"([^\n]*)\n      sha256 "[^"\n]+"'
        replacement = rf'\g<1>      url "{url}"\g<2>\n      sha256 "{sha256}"'
        result, count = re.subn(pattern, replacement, result)
        if count != 1:
            raise ValueError(f"Expected one {arch} download in {path}")
    if result == original:
        print(f"{name} {version}: already current")
        return
    # A bottle contains the previous downloads, so remove it when either changes.
    result = re.sub(r'\n  bottle do\n.*?\n  end\n', '', result, flags=re.S)
    result = re.sub(r'^  (?:revision|rebuild) \d+\n', '', result, flags=re.M)
    if dry_run:
        import difflib
        print(''.join(difflib.unified_diff(original.splitlines(True), result.splitlines(True),
                                         fromfile=str(path), tofile=str(path))), end='')
        return
    with tempfile.NamedTemporaryFile(mode="w", dir=path.parent, delete=False) as temporary:
        temporary.write(result)
        temporary_path = Path(temporary.name)
    temporary_path.chmod(path.stat().st_mode & 0o777)
    temporary_path.replace(path)
    print(f"Updated {path.relative_to(ROOT)} to {version}")
