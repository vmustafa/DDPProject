library(shiny)

shinyUI(
    navbarPage("Predictors Study",
               
        ## individual scatter plots for comparison with outcome scatter
        tabPanel("Individual Scatter Plots",
            sidebarLayout(
                sidebarPanel(
                    helpText("Scatter plot of Outcome is shown on left.",
                             "Scatter plot of your predictor choice is on the right."),
                    br(),
                    radioButtons("scPredRadio", "Choose Predictor",
                        pNames)
                ),
                mainPanel(fluidPage(
                    fluidRow(
                        column(6, align = "center",
                            h3("Outcome Scatter", align = "center"),
                            plotOutput('scPlotOutcome')
                        ),
                        column(6, align = "center",
                            h3("Chosen Predictor Scatter", align = "center"),
                            plotOutput('scPlotPred')
                        )
                    )
                ))
            )
        ),
        

        ## x-y plots with outcome on Y & chosen predictor on X
        tabPanel("Predictor-Outcome Plots",
                 sidebarLayout(
                     sidebarPanel(
                         helpText("X-Y plot where Y is always the Outcome.",
                                  "Choose your predictor (X), to study the relationship.",
                                  "Smoothing is done using lm. Correlation on extreme right"),
                         br(),
                         radioButtons("xyPredRadio", "Choose Predictor",
                                      pNames)
                     ),
                     mainPanel(fluidPage(
                         fluidRow(
                             column(8, align = "center",
                                    h3("Predictor-Outcome Plot", align = "center"),
                                    plotOutput('xyPlotOutcome')
                             ),
                             column(4, br(), br(), br(), br(), br(),br(), br(), br(),
                                    br(), br(), br(),br(), br(), br(),
                                    h4("Correlation Ratio is ", align = "center"),
                                    h3(textOutput('xoCor'), align = "center")
                             )
                         )
                     ))
                 )
        ),
        

        
        ## x-y plots with predictors on X,Y axes
        tabPanel("Predictor-Predictor Plots",
                 sidebarLayout(
                     sidebarPanel(
                         helpText("X-Y plot where you choose your X predictor as well as ",
                                  "your Y predictor, to study the relationship.",
                                  "Smoothing is done using lm. Correlation on extreme right"),
                         br(),
                         selectInput("xPredSelect", "Choose X Predictor",
                                      pNames),
                         br(), br(), br(),
                         selectInput("yPredSelect", "Choose Y Predictor",
                                     pNames,pNames[2])
                         
                     ),
                     mainPanel(fluidPage(
                         fluidRow(
                             column(8, align = "center",
                                    h3("Predictor-Predictor Plot", align = "center"),
                                    plotOutput('xyPlotPreds')
                             ),
                             column(4, br(), br(), br(), br(), br(),br(), br(), br(),
                                    br(), br(), br(),br(), br(), br(),
                                    h4("Correlation Ratio is ", align = "center"),
                                    h3(textOutput('xyCor'), align = "center")
                             )
                         )
                     ))
                 )
        ),
        
        
        ## Multivariate Correlations
        tabPanel("Multivariate Correlations",
                 sidebarLayout(
                     sidebarPanel(
                         helpText("Plots to study multiple predictor relationships. ",
                                  "Keep selecting more than 1 predictors (including Outcome), to study the relationship.",
                                  "Left plot shows x-y plot, histogram & correlation values. ",
                                  "Right plot shows color coded correlations"),
                         br(),
                         checkboxGroupInput("varsChecked", "Check Variables of Interest (min 2)",
                                     allNames, selected = allNames[1:4])
                         
                     ),
                     mainPanel(fluidPage(
                         fluidRow(
                             column(6, align = "center",
                                    h3("Multiple Variables Scatter", align = "center"),
                                    plotOutput('multiScatters')
                             ),
                             column(6, align = "center",
                                    h3("Multiple Variables Correlations", align = "center"),
                                    plotOutput('multiCorrs')
                             )
                         )
                     ))
                 )
        ),
        

        ## About
        tabPanel("About",
                 sidebarLayout(
                     sidebarPanel(
                         h4("About Predictors Study Application ", align = "center")
                     ),
                     mainPanel(fluidPage(
                         fluidRow(
                             column(12, includeMarkdown("about.md"))
                         )
                     ))
                 )
        )
        
        
        
        
    )
)
        
        
        
        
        
        
# navbarMenu("More",
#                               tabPanel("Table",
#                                        dataTableOutput("table")
#                               ),
#                               tabPanel("About",
#                                        fluidRow(
#                                                column(6,
#                                                       includeMarkdown("about.md")
#                                                ),
#                                                column(3,
#                                                       img(class="img-polaroid",
#                                                           src=paste0("http://upload.wikimedia.org/",
#                                                                      "wikipedia/commons/9/92/",
#                                                                      "1919_Ford_Model_T_Highboy_Coupe.jpg")),
#                                                       tags$small(
#                                                               "Source: Photographed at the Bay State Antique ",
#                                                               "Automobile Club's July 10, 2005 show at the ",
#                                                               "Endicott Estate in Dedham, MA by ",
#                                                               a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
#                                                                 "User:Sfoskett")
#                                                       )
#                                                )
#                                        )
#                               )
#                    )
# ))