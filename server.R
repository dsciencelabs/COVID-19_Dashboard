server <- function(input, output) {
  sourceDirectory("SERVER", recursive = TRUE)

  showNotification("Welcome to My Dashboard",
    duration = 10, type = "warning")

  # Trigger once an hour
  dataLoadingTrigger <- reactiveTimer(3600000)

  observeEvent(dataLoadingTrigger, {
    updateData()
  })

  observe({
    data <- data_atDate(input$timeSlider)
  })
}