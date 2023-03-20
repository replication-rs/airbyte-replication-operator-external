use std::path::PathBuf;
use trauma::{download::Download, downloader::DownloaderBuilder, Error};

#[tokio::main]
async fn main() -> Result<(), Error> {
    for cab in vec!["green", "yellow"] {
        let mut downloads = vec![];
        for i in 1..=11 {
            let mut reqwest_rs = format!(
                "https://d37ci6vzurychx.cloudfront.net/trip-data/{}_tripdata_2022-0{}.parquet",
                cab, i
            );
            if i > 9 {
                reqwest_rs = format!(
                    "https://d37ci6vzurychx.cloudfront.net/trip-data/{}_tripdata_2022-{}.parquet",
                    cab, i
                );
            }
            downloads.push(Download::try_from(reqwest_rs.as_str()).unwrap());
        }
        let downloader = DownloaderBuilder::new()
            .concurrent_downloads(1)
            .directory(
                PathBuf::from(env!("CARGO_MANIFEST_DIR"))
                    .join("datasets")
                    .join(format!("nyc_{}_2022", cab)),
            )
            .build();
        downloader.download(&downloads).await;
    }
    Ok(())
}
