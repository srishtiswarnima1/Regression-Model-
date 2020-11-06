##This Application is using the data from the library datasets provided by Rstudio. So, just install the required
## library to reproduce this. FOr more information check out the datasets documentation page on the official site of Rstudio

library(shiny)

shinyUI(
    navbarPage("Which car gives a better Mileage?",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("Relationship between different variables of a car and how it affects its MPG and Regression Models for the same"), #sdnlafafmld
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Number of cylinders (4/6/8)" = "cyl", # no, of cylinders in engine 
                                                  "Displacement (cu.in.)" = "disp", ## how much it diplaces in rotation
                                                  "Gross horsepower" = "hp", # How powerful the car is 
                                                  "Rear axle ratio" = "drat", # rear axle ratio affects 
                                                  "Weight (lb/1000)" = "wt", # the weight of the car
                                                  "1/4 mile time" = "qsec", #the time taken 
                                                  "V/S" = "vs",
                                                  "Transmission Mode (Automatic/Manual)" = "am", #take a manual car next time to save money on gas
                                                  "Number of forward gears (3/4/5)" = "gear", # 4 is the golde no. 
                                                  "Number of carburetors (1/2/3/4/6/8)" = "carb" # just google this thing 
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE) # this to check if their are data points that do not fit or show anomaly
                                ),
                                
                                mainPanel(   #main panel which is in the centre 
                                    h2(textOutput("caption")), ## the heading of the main panel goes here 
                                    
                                    tabsetPanel(type = "tabs",  # I have two tabs 
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")), # I am using a basic box plot for the data
                                                tabPanel("Regression model ", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               )
             
        
    )
)
