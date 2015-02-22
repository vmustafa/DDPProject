library(shiny)

shinyServer(
    function(input, output, session) {
        
        scPred <- reactive({input$scPredRadio}) #tab1
        xyPred <- reactive({input$xyPredRadio}) #x-y plots with outcome on Y & chosen predictor on X
        xPred <- reactive({input$xPredSelect}) #x-y plots with predictors on X,Y axes
        yPred <- reactive({input$yPredSelect}) #x-y plots with predictors on X,Y axes
        vars <- reactive({input$varsChecked}) #Multivariate Correlations
        
        #individual scatter plots for comparison with outcome scatter
        output$scPlotOutcome <- renderPlot({
            plot(df[,outcome],ylab=outcome,type="p",cex=.5,col="blue")
        })
        
        output$scPlotPred <- renderPlot({
            plot(df[,scPred()],
                 ylab=scPred(),type="p",cex=.5,col="blue")
        })
        
        #x-y plots with outcome on Y & chosen predictor on X
        output$xyPlotOutcome <- renderPlot({
            qq <- qplot(x=df[,xyPred()], y=df[,outcome],
                        xlab=xyPred(), ylab=outcome,
                        main="X-Outcome Plot")
            qq <- qq + geom_point(colour="blue",size = 1)
            qq <- qq + geom_smooth(method="lm",formula=y~x)
            qq
        })
        
        output$xoCor <- renderText({round(
            cor(df[,xyPred()],df[,outcome]),4)})
        
        #x-y plots with predictors on X,Y axes
        output$xyPlotPreds <- renderPlot({
            qq <- qplot(x=df[,xPred()], y=df[,yPred()],
                        xlab=xPred(), ylab=yPred(),
                        main="X-Y Plot")
            qq <- qq + geom_point(colour="blue",size = 1)
            qq <- qq + geom_smooth(method="lm",formula=y~x)
            qq
        })
        
        output$xyCor <- renderText({round(
            cor(df[,xPred()],df[,yPred()]),4)})
        
        #Multivariate Correlations
        output$multiScatters <- renderPlot({
            suppressWarnings(chart.Correlation(df[,vars()]))
        })
        
        output$multiCorrs <- renderPlot({
            levelplot(cor(df[,vars()]))
        })
        
        
        
        
})