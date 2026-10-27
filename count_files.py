
#!/usr/bin/env python3

import os
import sys
from collections import Counter
from pathlib import Path


def count_files(folder_path):
    folder = Path(folder_path)

    if not folder.is_dir():
        print(f"Error: '{folder_path}' is not a valid folder.")
        sys.exit(1)

    extensions = Counter()

    for item in folder.iterdir():
        if item.is_file():
            extension = item.suffix.lower() or "[no extension]"
            extensions[extension] += 1

    if not extensions:
        print("No files found.")
        return

    print(f"File counts in: {folder.resolve()}\n")

    for extension, count in sorted(extensions.items()):
        print(f"{extension}: {count}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 count_files.py <folder_path>")
        sys.exit(1)

    count_files(sys.argv[1])
