library(shiny)
library(datasets)

yehdatahai <- mtcars
yehdatahai$am <- factor(yehdatahai$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("MPG ~", input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("MPG ~", "as.integer(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(as.formula(formulaTextPoint()), data=yehdatahai)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = yehdatahai,
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$mpgPlot <- renderPlot({
        with(yehdatahai, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        })
    })
    
})