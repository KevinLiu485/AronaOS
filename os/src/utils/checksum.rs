pub fn calculate_checksum(data: &[u8]) -> u8 {
    data.iter().fold(0u8, |acc, &x| acc.wrapping_add(x))
}

// pub fn print_file(data: &[u8]) {
//     for i in 0..data.len() {
//         print!("{:02x} ", data[i]);
//         // if (i + 1) % 16 == 0 {
//         //     println!();
//         // }
//     }
//     // println!();
// }
