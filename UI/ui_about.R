body_about <- dashboardBody(
  fluidRow(
    fluidRow(
      column(
        box(title = div("About this project", style = "padding-left: 20px", class = "h2"),
          column(
            h3("The Background of COVID-19 Dashboard"),
            "This COVID-19 Dashboard was build from Shiny packages and developed by Bakti Siregar, M.Sc (Professional Data Science and Lectuter at Matana University). This App demonstrates some recent news about the Coronavirus pandemic. 
            All data was import from the John Hopkins dataset, and shows some data related to mortality, recovery, infected, and etc.",
            tags$br(),
            h3("Words of Wisdom to Fight the COVID-19 Deases"),
            "Please stay at home, distance yourself from others and be healthy. We must not only keep our hands clean
            , let us get ride of any thing that contaminate the body. The soul of spirit must be equally kept clean. 
            Because we know that the key to overcome this crisis is patience, courage, self-discipline, adaptation and alertness.",
            tags$br(),
            h3("Disclaimer"),
            "This App is for educational purposes only. Opinions or points of view expressed in this App represent the view of the
            creator only, that relies on public data from the John Hopkins, WHITING SCHOOL OF ENGINEERING, CENTER FOR SYSTEMS SCIENCE AND ENGINEERING. 
            Nothing in this App constitutes legal advice.",
            tags$br(),
            h3(" "),
            width = 12),
          width = 12,
),
        width = 12,
        style = "padding: 15px"
      )
    )
  )
)


page_about <- dashboardPage(
  title = "About",
  header = dashboardHeader(disable = TRUE),
  sidebar = dashboardSidebar(disable = TRUE),
  body = body_about
)
