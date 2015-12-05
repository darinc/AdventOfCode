extern crate crypto;
use crypto::digest::Digest;
use crypto::md5::Md5;


fn main() {
  println!("Advent of code Day 4 - Rust");

  let puzzle_input = "yzbqklnj".to_owned();
  let mut x = 0;
  let mut part1_done = false;
  let mut part2_done = false;
  let mut all_done = false;


  while !all_done {
    let mut md5 = Md5::new();

    // I do not grock rust strings
    let s1 = format!("{}{}", puzzle_input, x.to_string());
    let s2: &str = &*s1;

    md5.input_str(s2);
    let md5result = md5.result_str();
    let md5bytes = md5result.as_bytes();


    if part1_done == false && &md5bytes[0 .. 5] == "00000".as_bytes() {
      println!("Part one: first five zero coin hash {} generated at number {}", md5result, x);
      part1_done = true;
    }

    if part2_done == false && &md5bytes[0 .. 6] == "000000".as_bytes() {
      println!("Part two: first six zero coin hash {} generated at number {}", md5result, x);
      part2_done = true;
    }

    if part1_done && part2_done {
      all_done = true;
    }

    x += 1;
  }
}
