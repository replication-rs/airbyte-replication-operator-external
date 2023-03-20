use local_ip_address::local_ip;
use parquet::{
    file::reader::{FileReader, SerializedFileReader},
    schema::printer::{print_file_metadata, print_parquet_metadata, print_schema},
};
use std::path::PathBuf;
use std::{fs::File, path::Path};

fn main() {
    let local_ip = local_ip().unwrap();
    println!("This is the local IP address: {:?}", local_ip);
}

fn schema() {
    let path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("datasets")
        .join("nyc_yellow_2022/yellow_tripdata_2022-01.parquet");
    if let Ok(file) = File::open(&path) {
        let reader = SerializedFileReader::new(file).unwrap();
        let parquet_metadata = reader.metadata();

        print_parquet_metadata(&mut std::io::stdout(), &parquet_metadata);
        print_file_metadata(&mut std::io::stdout(), &parquet_metadata.file_metadata());
        print_schema(&mut std::io::stdout(), &parquet_metadata.file_metadata().schema());
    }
}
