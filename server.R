library(plotly)
library(Cairo)
library(Seurat)
options(shiny.usecairo=T)


if(FALSE){
  install.packages('Seurat')
}


if(TRUE){
  options(shiny.sanitize.errors = FALSE)
  # logging level DEBUG
  logging::basicConfig(level = 10)
  # write logging output to the stderr file
  logging::addHandler(logging::writeToFile, logger = '', file = stderr())
}



if(FALSE){
  #To run this app
  library(shiny)
  runApp(".")
}


server <- function(input, output, session) {


  ##############################################################################
  ########### General functions ################################################
  ##############################################################################
  
  
  getSeuratData <- reactive({    
    current_ds <- input$input_ds
    available_datasets[[current_ds]]
  })
  
  
  
  ##############################################################################
  ########### Callbacks - dataset ##############################################
  ##############################################################################
  

  
  
  ##############################################################################
  ########### Scatter plot tab #################################################
  ##############################################################################

  output$plotScatter <- renderPlot({

    
    pbmc <- getSeuratData()
    
    set.seed(input$random_seed)

    pbmc <- FindNeighbors(pbmc, dims = 1:10)
    pbmc <- FindClusters(pbmc, resolution = input$leiden_resolution)
    
    
    DimPlot(pbmc, reduction = "umap",label=TRUE)
    
    
  #  egg::ggarrange(p1,p2,p3,p4)
  })

    
  
  

}



