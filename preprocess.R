


library(Seurat)

pbmc.data <- Read10X(data.dir = "raw/pbmc/")
pbmc <- CreateSeuratObject(counts = pbmc.data, project = "pbmc3k", min.cells = 3, min.features = 200)

pbmc <- NormalizeData(pbmc)
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)
all.genes <- rownames(pbmc)
pbmc <- pbmc[VariableFeatures(pbmc),]  ### save space!!!
pbmc <- ScaleData(pbmc, features = VariableFeatures(object = pbmc))
pbmc <- RunPCA(pbmc, features = VariableFeatures(object = pbmc))
pbmc <- RunUMAP(pbmc, dims = 1:10)

saveRDS(pbmc, "data/pbmc.RDS")
