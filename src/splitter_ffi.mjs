import {
  List$Empty,
  List$NonEmpty,
  List$isNonEmpty,
  List$NonEmpty$first,
  List$NonEmpty$rest,
} from "./gleam.mjs";

export function make(patterns) {
  let pattern = "";
  let cursor = patterns;
  while (List$isNonEmpty(cursor)) {
    if (pattern !== "") pattern += "|";
    pattern += escapeRegExp(List$NonEmpty$first(cursor));
    cursor = List$NonEmpty$rest(cursor);
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

export function would_split(splitter, string) {
  // According to https://tc39.es/ecma262/#sec-escaperegexppattern
  // RegExp.source must escape "" as "(?:)"
  // i.e. this checks for the empty splitter
  if (splitter.source === "(?:)") return false
  return splitter.test(string)
}

function escapeRegExp(string) {
  return string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

export function split_all(splitter, string) {
  let list = List$Empty();
  if (splitter.source === "(?:)") return List$NonEmpty(string, list);
  const parts = string.split(splitter);
  while (parts.length) {
    list = List$NonEmpty(parts.pop(), list);
  }
  return list;
}
