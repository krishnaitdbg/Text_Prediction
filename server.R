# Define server logic to render output

## Predict the next word based on the input string. 
## Call user defined function 'Predict' to predict the next word using stupid backoff model.
## See script global.R for the user defined function 'Predict'.

shinyServer(function(input, output) {
    output$prediction <- renderPrint({
        ptext <- Predict(input$inputString)
        ptext
    });
    
})
