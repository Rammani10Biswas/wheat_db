install.packages("shinydashboard")
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  #assign the header of web Page
  dashboardHeader(title = "Chickpea Portal"),
  #Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabNane="home", icon=icon("home")),
      menuItem("Contact Us",  tabNane="contact_info", icon=icon("th")),
      menuItem("MAPs",  tabNane="maps", icon=icon("th")),
      menuItem("Gene families",  tabNane="gene_family", icon=icon("chart-bar")),
      menuItem("Gene Search",  tabNane="gene_search", icon=icon("th")),
      menuItem("Markers",  tabNane="markers", icon=icon("caret-down"),
               menuSubItem("SSRS", tabName = "ssrs"),
               menuSubItem("SNPs", tabName = "snps"),
               menuSubItem("Characterizes markers", tabName = "char_markers")
               ),
      menuItem("JBrowse",  tabNane="Jbrowse", icon=icon("th")),
      menuItem("Downloads",  tabNane="downloads", icon=icon("th")),
      menuItem("Publications",  tabNane="publications", icon=icon("file-alt"))
    )
  ),
    #Body content
    dashboardBody(
      tags$iframe(src="chickpea_shiny.html", height=600, width=100),
     tabItems(

       tabItem(tabName = "home",
               h2("Contents"),
               p("Chickpea (Cicer arietinum) is the third most important food legume crop with 96% of its cultivation occurring developing countries. Chickpea is grown mostly in Western Asia, Mediterranean basin, South-East Asia, eastern Africa and in some parts of Canada and Australia. Most of the chickpea grown are consumed locally demonstrating its importance in life and livelihood of the local people. Further, being a grain legume, it plays important role in soil fertility and diversifying cereal-based cropping system. Considering its importance, various efforts have been made to develop genomic and genetic resources of chickpea. A number of draft grade genome assemblies and a pan-genome assembly have been generated and genetic variation maps based on sequencing of more than 3000 chickpea genome have generated a large volume of genomic resources and breeding strategies. This database presents graphical scanning of genes, simple sequence repeats, primer sequences and some of the characterized genetic markers altogether or separately along eight chromosomes of chickpea in a single window. The database provides options to find out genes through similarity searches using different genome assemblies including the pangenome. Sequences of 2 kb-long 5’ upstream regions of the genes and gene family-wise classifications and the SNP profile of the genes based on resequencing data allow the researchers and application specialist to search and analyze the genes and the genetic marker in a graphical and user-friendly manner.")
       ),
       tabItem(tabName = "contact_info",
               h2("CONTACT ADDRESS")
       ),
       tabItem(tabName = "maps",
               h2("Chickpea Genome Map")
       ),
       tabItem(tabName = "gene_family",
               h2("Gene Families"),
               p("There are 29,870 genes present in Chickpea pan-genome and 22,983 genes have been assigned to eight chromosomes. The number of genes present in each chromosome were indicated on the top of the each chromosome within brackets.")
       ),
       tabItem(tabName = "gene_search",
               h2("Search for Genes")
       ),
       tabItem(tabName = "ssrs",
               h2("Simple Sequence Repeats"),
               p("Pan-genome spanning 592 Mb contain 72,193 sequence repeats of which, 63,248 (87.61%) and 8,945 (12.39%) were simple and compound repeats, respectively. Of the 63,248 simple repeats, primer pairs for 41,977 SSRs (66.37%) could be successfully designed. All the SSRs, for which primer pairs were designed, were anchored to individual chromosomes according to their coordinates. The user can query the database from `SSRs` tab using motif sequence, chromosome number, two coordinates of a chromosome or combination of repeat length and minimum number of repeat.")
       ),
       tabItem(tabName = "snps",
               h2("Search for SNPs")
       ),
       tabItem(tabName = "char_markers",
               h2("Search for characterized markers")
       ),
       tabItem(tabName = "Jbrowse",
               h2("View on JBrowse")
       ),
       tabItem(tabName = "downloads",
               h2("Batch Download")
       ),
       tabItem(tabName = "publications",
               h2("List of publications")
       )


     )


    )
  )

server <- function(input, output) {

output$output1 <- renderUI({
  includeHTML(path="chickpea_shiny.html")
})
}
shinyApp(ui=ui, server=server)
dir.create("chickpea_shiny/www")
dir.create("www/")
