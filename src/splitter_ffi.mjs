export function make(patterns) {
  let pattern = "";
  let cursor = patterns;
  while (cursor.tail) {
    if (pattern !== "") pattern += "|";
    pattern += escapeRegExp(cursor.head);
    cursor = cursor.tail;
  }
  return new RegExp(pattern);
}

export function split(splitter, string) {
  const match = string.match(splitter);

  if (!match) return [string, "", ""]; // No delimiter found

  const index = match.index;
  const delimiter = match[0];

  return [
    string.slice(0, index),
    delimiter,
    string.slice(index + delimiter.length),
  ];
}

export function split_before(splitter, string) {
  const match = string.match(splitter);

  if (!match) return [string, ""]; // No delimiter found

  const split_point = match.index;
  return [string.slice(0, split_point), string.slice(split_point)];
}

export function split_after(splitter, string) {
  const match = string.match(splitter);

  if (!match) return [string, ""]; // No delimiter found

  const split_point = match.index + match[0].length;
  return [string.slice(0, split_point), string.slice(split_point)];
}

function escapeRegExp(string) {
  return string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}
