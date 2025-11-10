import gleam/bool
import gleeunit
import gleeunit/should
import splitter

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn split_0_test() {
  splitter.new(["a", "b"])
  |> splitter.split("111a222")
  |> should.equal(#("111", "a", "222"))
}

pub fn split_1_test() {
  splitter.new(["a", "b"])
  |> splitter.split("111b222")
  |> should.equal(#("111", "b", "222"))
}

pub fn split_2_test() {
  splitter.new(["a", "b"])
  |> splitter.split("111a222b333")
  |> should.equal(#("111", "a", "222b333"))
}

pub fn split_3_test() {
  splitter.new(["a", "b"])
  |> splitter.split("111a222b333")
  |> should.equal(#("111", "a", "222b333"))
}

// Right at the start
pub fn split_4_test() {
  splitter.new(["a", "b"])
  |> splitter.split("a222b333")
  |> should.equal(#("", "a", "222b333"))
}

// One pattern is a substring of the other
pub fn split_5_test() {
  splitter.new(["ab", "a"])
  |> splitter.split("ab11")
  |> should.equal(#("", "ab", "11"))
}

// No patterns
pub fn split_6_test() {
  splitter.new([])
  |> splitter.split("ab11")
  |> should.equal(#("", "", "ab11"))
}

// Empty patterns
pub fn split_7_test() {
  splitter.new(["", "ab", "", "a", ""])
  |> splitter.split("22ab11")
  |> should.equal(#("22", "ab", "11"))
}

pub fn split_before_0_test() {
  splitter.new(["a", "b"])
  |> splitter.split_before("111a222")
  |> should.equal(#("111", "a222"))
}

pub fn split_before_1_test() {
  splitter.new(["a", "b"])
  |> splitter.split_before("111b222")
  |> should.equal(#("111", "b222"))
}

pub fn split_before_2_test() {
  splitter.new(["a", "b"])
  |> splitter.split_before("111a222b333")
  |> should.equal(#("111", "a222b333"))
}

pub fn split_before_3_test() {
  splitter.new(["a", "b"])
  |> splitter.split_before("111a222b333")
  |> should.equal(#("111", "a222b333"))
}

// Right at the start
pub fn split_before_4_test() {
  splitter.new(["a", "b"])
  |> splitter.split_before("a222b333")
  |> should.equal(#("", "a222b333"))
}

// One pattern is a substring of the other
pub fn split_before_5_test() {
  splitter.new(["ab", "a"])
  |> splitter.split_before("ab11")
  |> should.equal(#("", "ab11"))
}

// No patterns
pub fn split_before_6_test() {
  splitter.new([])
  |> splitter.split_before("ab11")
  |> should.equal(#("", "ab11"))
}

// Empty patterns
pub fn split_before_7_test() {
  splitter.new(["", "ab", "", "a", ""])
  |> splitter.split_before("22ab11")
  |> should.equal(#("22", "ab11"))
}

pub fn split_after_0_test() {
  splitter.new(["a", "b"])
  |> splitter.split_after("111a222")
  |> should.equal(#("111a", "222"))
}

pub fn split_after_1_test() {
  splitter.new(["a", "b"])
  |> splitter.split_after("111b222")
  |> should.equal(#("111b", "222"))
}

pub fn split_after_2_test() {
  splitter.new(["a", "b"])
  |> splitter.split_after("111a222b333")
  |> should.equal(#("111a", "222b333"))
}

pub fn split_after_3_test() {
  splitter.new(["a", "b"])
  |> splitter.split_after("111a222b333")
  |> should.equal(#("111a", "222b333"))
}

// Right at the start
pub fn split_after_4_test() {
  splitter.new(["a", "b"])
  |> splitter.split_after("a222b333")
  |> should.equal(#("a", "222b333"))
}

// One pattern is a substring of the other
pub fn split_after_5_test() {
  splitter.new(["ab", "a"])
  |> splitter.split_after("ab11")
  |> should.equal(#("ab", "11"))
}

// No patterns
pub fn split_after_6_test() {
  splitter.new([])
  |> splitter.split_after("ab11")
  |> should.equal(#("", "ab11"))
}

// Empty patterns
pub fn split_after_7_test() {
  splitter.new(["", "ab", "", "a", ""])
  |> splitter.split_after("22ab11")
  |> should.equal(#("22ab", "11"))
}

pub fn would_split_0_test() {
  assert splitter.new(["a", "b"])
    |> splitter.would_split("111a222")
}

pub fn would_split_1_test() {
  assert splitter.new(["a", "b"])
    |> splitter.would_split("111b222")
}

pub fn would_split_2_test() {
  assert splitter.new(["a", "b"])
    |> splitter.would_split("111a222b333")
}

pub fn would_split_3_test() {
  assert splitter.new(["a", "b"])
    |> splitter.would_split("111a222b333")
}

pub fn would_split_4_test() {
  assert splitter.new(["a", "b"])
    |> splitter.would_split("a222b333")
}

pub fn would_split_5_test() {
  assert splitter.new(["ab", "a"])
    |> splitter.would_split("ab11")
}

pub fn would_split_6_test() {
  assert splitter.new([])
    |> splitter.would_split("ab11")
    |> bool.negate
}

pub fn would_split_7_test() {
  assert splitter.new(["", "ab", "", "a", ""])
    |> splitter.would_split("22ab11")
}

// no matching patterns
pub fn would_split_8_test() {
  assert splitter.new(["c", "3"])
    |> splitter.would_split("11ab22ba")
    |> bool.negate
}

// right at the end
pub fn would_split_9_test() {
  assert splitter.new(["b"])
    |> splitter.would_split("11aa21ab")
}
