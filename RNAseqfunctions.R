Catx2gene <- function(dds) {
    Catx2gene <- read.csv("~/SeqFiles/2021_12-02_Ca_Aallele_genename_conversion.csv", header = TRUE)
    Catx2gene <- Catx2gene[match(rownames(dds), Catx2gene$Assembly22),] #matches order of all genes
    all(rownames(dds) == Catx2gene$Assembly22, na.rm=TRUE) #checks that order of genes matched in both files
    row.names(dds) <- Catx2gene$allele_genename 
    head(row.names(dds))
    return(dds)
}

PCA <- function(dataset, title, samplename=FALSE){
    PCAdata <- plotPCA(dataset, intgroup = c( "condition"), returnData = TRUE)
    percentVar <- round(100 * attr(PCAdata, "percentVar"))
    ggplot(PCAdata, aes(x = PC1, y = PC2, color = condition)) +
      geom_point(size =3) +
      xlab(paste0("PC1: ", percentVar[1], "% variance")) +
      ylab(paste0("PC2: ", percentVar[2], "% variance")) +
      coord_fixed()  + ggtitle(title) + {if(samplename == TRUE)geom_text(aes(label=colnames(dataset)),hjust=0, vjust=0)} }

DEseqimport <- function(countdata, sampledata, catx2gene=TRUE){

    dds <- DESeqDataSetFromMatrix(countData = countdata,
                              colData = sampledata,
                              design = ~condition)

    nrow(dds)
    dds <- dds[ rowSums(counts(dds)) > 1, ]
    nrow(dds)
    head(row.names(dds))

    if (catx2gene == TRUE){
        dds <- Catx2gene(dds)}
    else {}
    return(dds)
    }

volplot<- function(dds, title, subtitle=" ")   {
    library(EnhancedVolcano)
    EnhancedVolcano(dds,
    lab=rownames(dds),
    x = 'log2FoldChange',
    y = 'padj',
    xlab = bquote(~Log[2]~ 'fold change'),
    ylab = bquote(~Log[10]~ ~adjusted~ 'P value'),
    pCutoff = 0.01,
    FCcutoff = 2,
    # xlim = c(),
    legendPosition = 'bottom',
    legendLabSize = 10,
    legendIconSize = 3.0,
    title = title,
    subtitle = subtitle)}

save_pheatmap_pdf <- function(x, filename, width=7, height=7) {
   stopifnot(!missing(x))
   stopifnot(!missing(filename))
   pdf(filename, width=width, height=height)
   grid::grid.newpage()
   grid::grid.draw(x$gtable)
   dev.off()
}
