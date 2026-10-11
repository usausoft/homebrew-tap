/**
 * Parse the portable checksum format emitted by `sha256sum` and `shasum -a 256`.
 *
 * GNU tools separate text-mode files with two spaces and binary-mode files with
 * ` *`. Accept both forms so every supported release runner produces the same
 * lookup table.
 */
export function parseChecksumFile(source) {
  const entries = {};

  for (const rawLine of source.trim().split(/\r?\n/u)) {
    const match = /^([a-f\d]{64})\s+\*?(.+)$/iu.exec(rawLine.trim());
    if (!match) {
      throw new Error(`Invalid SHA256SUMS line: ${rawLine}`);
    }

    const [, checksum, file] = match;
    entries[file] = checksum.toLowerCase();
  }

  return entries;
}
