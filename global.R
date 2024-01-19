

### Load all available datasets
available_datasets <- list()
for(f in list.files("data")){
  print(paste("=================== Adding dataset ",f))
  onedat <- readRDS(file.path("data",f))
  print(head(onedat))
  available_datasets[[f]] <- onedat
}
print("Done loading")
