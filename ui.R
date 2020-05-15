# Shiny Dashboard COVID19 (No SQL). 
# Written by : Bakti Siregar, M.Sc
# Department of Business statistics, Matana University (Tangerang)
# Notes: Please don't share this code anywhere (It's just for you)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

source("UI/ui_overview.R", local = TRUE)
source("UI/ui_plots.R", local = TRUE)
source("UI/ui_about.R", local = TRUE)
source("UI/ui_fullTable.R", local = TRUE)

ui <- fluidPage(theme = shinytheme("yeti"),
  title = "COVID-19 Dashboard with Shiny App",
  tags$head(tags$link(rel = "shortcut icon", type = "image/png", href = "search.png")),
  tags$style(type = "text/css", ".container-fluid {padding-left: 0px; padding-right: 0px !important;}"),
  tags$style(type = "text/css", ".navbar {margin-bottom: 0px;}"),
  tags$style(type = "text/css", ".content {padding: 0px;}"),
  tags$style(type = "text/css", ".row {margin-left: 0px; margin-right: 0px;}"),
  tags$style(HTML(".col-sm-12 { padding: 5px; margin-bottom: -15px; }")),
  tags$style(HTML(".col-sm-6 { padding: 5px; margin-bottom: -15px; }")),
  navbarPage(title = div("COVID-19 Dashboard", style = "padding-left: 10px"),
    inverse = TRUE,
    collapsible = TRUE,
    fluid       = TRUE,
    tabPanel("Overview", icon = icon("user-cog"), page_overview, value = "page-overview"),
    tabPanel("Table", icon = icon("database"), page_fullTable, value = "page-fullTable"),
    tabPanel("Plots", icon = icon("bar-chart"), page_plots, value = "page-plots"),
    tabPanel("About", icon = icon("info-circle"), page_about, value = "page-about"),
    navbarMenu("More", icon = icon("question-circle"),
               tabPanel(tags$a("", href = "https://github.com/Bakti-Siregar/COVID-19_Dashboard/", target = "_blank",list(icon("github"), "Resources"))),
               tabPanel(tags$a("", href = "https://www.linkedin.com/in/bakti-siregar-15955480/", target = "_blank",list(icon("linkedin"), "My Profile"))),
               tabPanel(tags$a("", href = "https://master-data-scientist.shinyapps.io/COVID19-Dashboard-Prediction", target = "_blank",list(icon("connectdevelop"), "More Advanced Dashboard")))
    ),
    tags$script(HTML("var header = $('.navbar > .container-fluid');
    header.append('<div style=\"float:right\"><a target=\"_blank\" href=\"https://www.youtube.com/watch?v=cNcLxXbFEEA\"><img src=\"Matana.png\" alt=\"alt\" style=\"float:right;width:33px;padding-top:10px;margin-top:-50px;margin-right:10px\"> </a></div>');
    console.log(header)")
    )
  )
)