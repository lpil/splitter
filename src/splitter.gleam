import gleam/list

pub type Splitter

/// Create a new splitter for a given list of substrings.
///
/// Substrings are matched for in the order the appear in the list, if one
/// substring is the substring of another place it later in the list than the
/// superstring.
///
/// Empty strings are discarded, and an empty list will not split off any
/// prefix.
///
/// There is a small cost to creating a splitter, so if you are going to split
/// a string multiple times, and you want as much performance as possible, then
/// it is better to reuse the same splitter than to create a new one each time.
///
pub fn new(substrings: List(String)) -> Splitter {
  substrings
  |> list.filter(fn(x) { x != "" })
  |> make
}

/// Use the splitter to find the first substring in the input string, splitting
/// the input string at that point.
///
/// A tuple of three strings is returned:
/// 1. The string prefix before the split.
/// 2. The substring the string was split with.
/// 3. The string suffix after the split.
///
/// If no substring was found then strings 2 and 3 will be empty, and string 1
/// will be the whole input string.
///
/// # Examples
///
/// ```gleam
/// let line_ends = splitter.new(["\n", "\r\n"])
///
/// splitter.split(line_ends, "1. Bread\n2. Milk\n")
/// // -> #("1. Bread", "\n", "2. Milk\n")
///
/// splitter.split(line_ends, "No end of line here!")
/// // -> #("No end of line here!", "", "")
/// ```
///
@external(erlang, "splitter_ffi", "split")
@external(javascript, "./splitter_ffi.mjs", "split")
pub fn split(splitter: Splitter, string: String) -> #(String, String, String)

/// Use the splitter to find the first substring in the input string, splitting
/// the input string at that point.
///
/// A tuple of two strings is returned:
/// 1. The string prefix before the split.
/// 3. The string suffix after and including the split.
///
/// If no substring was found then the suffix will be empty, and the prefix
/// will be the whole input string.
///
/// # Examples
///
/// ```gleam
/// let line_ends = splitter.new(["\n", "\r\n"])
///
/// splitter.split(line_ends, "1. Bread\n2. Milk\n")
/// // -> #("1. Bread", "\n2. Milk\n")
///
/// splitter.split(line_ends, "No end of line here!")
/// // -> #("No end of line here!", "")
/// ```
///
@external(erlang, "splitter_ffi", "split_in_two")
@external(javascript, "./splitter_ffi.mjs", "split_in_two")
pub fn split_in_two(splitter: Splitter, string: String) -> #(String, String)

@external(erlang, "splitter_ffi", "new")
@external(javascript, "./splitter_ffi.mjs", "make")
fn make(patterns: List(String)) -> Splitter
