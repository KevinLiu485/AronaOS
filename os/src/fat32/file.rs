use alloc::vec::Vec;

enum FileType {
    File,
    Directory,
}

pub struct FAT32File {
    clusters: Vec<usize>,
    file_type: FileType,
}

