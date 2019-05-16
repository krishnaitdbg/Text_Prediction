dashboardPage(
    skin = "purple",
    
    dashboardHeader(
        title = "Predict Text - Capstone Project - Coursera + Johns Hopkins University + SwiftKey",
        titleWidth=1500
    ),
    
    dashboardSidebar(
        sidebarMenu(id = "sidebar",
                    menuItem("Predict Text", tabName = "predictView",
                             icon = icon("keyboard", lib="font-awesome")
                    ),
                    menuItem("About", tabName = "about",
                             icon = icon("info-circle", lib="font-awesome")
                    )
        )
    ),
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "predictView",
                    img(src="Coursera.png", width="150px", height="50px"),
                    img(src="JohnsHopkins.png", width="150px", height="50px"),
                    img(src="SwiftKey.png", width="150px", height="50px"),
                    br(),
                    br(),
                    fluidRow(
                        column(width=12,
                               box(width=NULL,
                                   solidHeader = TRUE,
                                   status="primary",
                                   textInput("inputString", "Start typing below",value = ""),
                                   helpText("Predicted next words are suggested below")
                               ),
                               box(width=NULL,
                                   solidHeader = TRUE,
                                   status="warning",
                                   h2("Predicted Next Word"),
                                   verbatimTextOutput("prediction")
                               )
                        )
                    )
            ),
            
            tabItem(tabName = "about",
                    box(width = 12,
                        includeMarkdown("www/about.md")
                    )
            )
            
        ) 
    )  
) 
