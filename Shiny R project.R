library(shiny)
library(shinythemes)
library(shinydashboard)

#Prepare for data frame
city <- read.table(
  text = "
Code State Country
AK Alaska US
AL Alabama US 
AZ Arizona US
AR Arkansas US
CA California US
CO Colorado US
CT Connecticut US
DE Delaware US
DC District_of_Columbia US
FL Florida US
GA Georgia US
GU Guam US
HI Hawaii US
ID Idaho US
IL Illinois US
IN Indiana US
IA Iowa US
KS Kansas US
KY Kentucky US
LA Louisiana US
ME Maine US
MH Marshall_Islands US
MD Maryland US
MA Massachusetts US
MI Michigan US
MN Minnesota US
MS Mississippi US
MO Missouri US
MT Montana US
NE Nebraska US
NV Nevada US
NH New_Hampshire US
NJ New_Jersey US
NM New_Mexico US
NY New_York US
NC North_Carolina US
ND North_Dakota US
OH Ohio US
OK Oklahoma US
OR Oregon US
PW Palau US
PA Pennsylvania US
PR Puerto_Rico US
RI Rhode_Island US
SC South_Carolina US
SD South_Dakota US
TN Tennessee US
TX Texas US
UT Utah US
VI Virgin_Islands US
VT Vermont US
VA Virginia US
WA Washington US
WV West_Virginia US
WI Wisconsin US
WY Wyoming US
ON Ontario CA
QC Quebec CA
BC British_Columbia CA
AB Alberta CA
MB Manitoba CA
SK Saskatchewan CA 
NS Nova_Scotia CA
NB New_Brunswick CA
NL Newfoundland_and_Labrador CA
PE Prince_Edward_Island CA
NT Northwest_Territories CA
NU Nunavut CA
YT Yukon CA",
  header = TRUE,
  stringsAsFactors = FALSE)

city$State <- gsub('_',' ',city$State)


#start shiny r
ui <- dashboardPage(skin = "black",
  dashboardHeader(title = "Job Application",
                  tags$li(class="dropdown",tags$a(href="https://www.linkedin.com/in/sizhi-chen-479034168/", icon("linkedin"), "My Linkedin", target="_blank"))
                  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Personal Information", tabName = "personal", icon = icon("personal")),
      menuItem("Resume & Cover Letter", tabName = "resume", icon = icon("resume")),
      menuItem("Confirmation", tabName = "confirm", icon = icon("confirm")),
      menuItem("Contact us", tabName = "contact", icon = icon("contact"))
    )
  ),
  dashboardBody(
    #Personal information
    tabItems(
    #first tab item
    tabItem(tabName = "personal",
      tabBox(id = "t1", width = 12,
             #Bacis Information
             tabPanel("Basic Information", value = "bacis",
                      textInput("FName", h4("First Name"), value = "Enter your first name ..."),                      
                      textInput("LName", h4("Last Name"), value = "Enter your last name ..."),
                      dateInput("birthday", h4("Date of Birth"), value = "2000-01-01"),
                      selectInput("pronouns", h4("Gender Pronouns"),
                                  choices = list("Please select" = "Please select", "She/Her" = "She/Her",
                                                 "He/Him" = "He/Him", "They/THem" = "They/THem", "Costom" = "Costom"),
                                  selected = "Please select"),
                      textAreaInput("headline", h4("Headline"), rows = 5),
                      fluidRow(
                        column(1, offset = 0,
                               
                        ),
                        column(1, offset = 9,
                               actionButton("next1", label = "Next")
                        )
                      )
             ),
             #Address
             tabPanel("Current Address", value = "address",
                      selectInput("country", h4("Country"),
                                  unique(city$Country)), 
                      selectInput("states", h4("States"),
                                  choices = NULL), 
                      textInput("city", h4("City"), value = NULL, width =200),
                      textInput("street", h4("Street"), value = "Enter the street ...", width = 10000),
                      textInput("code", h4("Zip/Postal Code"), value = NULL, width =200),
                      fluidRow(
                        column(1, offset = 0,
                               actionButton("Previous2", label = "Previous")
                        ),
                        column(1, offset = 9,
                               actionButton("next2", label = "Next")
                        )
                      )
                                           
             ),
             #Working Experience
             tabPanel("Working Experience", value = "working",
                      selectInput("Working_Time", "Number of Working Experience",
                                  choices = list("1"=1,"2"=2,"3"=3), selected = 1),
                      conditionalPanel(condition = "input.Working_Time == 1",
                                       titlePanel("Working Experience 1"),
                                       checkboxInput("currect", "I am currently working in this role", value = FALSE),
                                       textInput("title1", "Title", "Ex: Data Analytics"),
                                       selectInput("Employment2", "Enployment Type",
                                                   choices = list("Please select" = "Please select",
                                                                  "Self-employed" = "Self-employed",
                                                                  "Freelance" = "Freelance",
                                                                  "Internship" = "Internship",
                                                                  "Contract Full-time" = "Contract Full-time",
                                                                  "Permanent Part-time" = "Permanent Part-time",
                                                                  "Contract Part-time" = "Contract Part-time",
                                                                  "Casual/On-Call" = "Casual/On-Call",
                                                                  "Seasonal" = "Seasonal",
                                                                  "Permanent Full-time" = "Permanent Full-time",
                                                                  "Co-op" = "Co-op"),
                                                   selected = "Please select"),
                                       textInput("company1", "Company Name", "Ex: Northeastern University"),
                                       textInput("location1", "Location", "Ex: Vancouver"),
                                       selectInput("type1", "Location Type",
                                                   choices = list("On-site" = 1,
                                                                  "Hybrid" = 2,
                                                                  "Remote" = 3),
                                                   selected = "1"),
                                       dateRangeInput("dates1", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                       textAreaInput("description1", "Description", rows = 3)
                                       
                                       ),
                      conditionalPanel(condition = "input.Working_Time == 2",
                        fluidRow(
                          column(3,
                                       titlePanel("Working Experience 1"),
                                       checkboxInput("currect", "I am currently working in this role", value = FALSE),
                                       textInput("title1", "Title", "Ex: Data Analytics"),
                                 selectInput("Employment1", "Enployment Type",
                                             choices = list("Please select" = "Please select",
                                                            "Self-employed" = "Self-employed",
                                                            "Freelance" = "Freelance",
                                                            "Internship" = "Internship",
                                                            "Contract Full-time" = "Contract Full-time",
                                                            "Permanent Part-time" = "Permanent Part-time",
                                                            "Contract Part-time" = "Contract Part-time",
                                                            "Casual/On-Call" = "Casual/On-Call",
                                                            "Seasonal" = "Seasonal",
                                                            "Permanent Full-time" = "Permanent Full-time",
                                                            "Co-op" = "Co-op"),
                                             selected = "Please select"),
                                       textInput("company1", "Company Name", "Ex: Northeastern University"),
                                       textInput("location1", "Location", "Ex: Vancouver"),
                                       selectInput("type1", "Location Type",
                                                   choices = list("On-site" = 1,
                                                                  "Hybrid" = 2,
                                                                  "Remote" = 3),
                                                   selected = "1"),
                                       dateRangeInput("dates1", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                       textAreaInput("description1", "Description", rows = 3)
                                       ),
                          column(3,
                                       titlePanel("Working Experience 2"),
                                       checkboxInput("currect", "I am currently working in this role", value = FALSE),
                                       textInput("title2", "Title", "Ex: Data Analytics"),
                                 selectInput("Employment2", "Enployment Type",
                                             choices = list("Please select" = "Please select",
                                                            "Self-employed" = "Self-employed",
                                                            "Freelance" = "Freelance",
                                                            "Internship" = "Internship",
                                                            "Contract Full-time" = "Contract Full-time",
                                                            "Permanent Part-time" = "Permanent Part-time",
                                                            "Contract Part-time" = "Contract Part-time",
                                                            "Casual/On-Call" = "Casual/On-Call",
                                                            "Seasonal" = "Seasonal",
                                                            "Permanent Full-time" = "Permanent Full-time",
                                                            "Co-op" = "Co-op"),
                                             selected = "Please select"),
                                       textInput("company2", "Company Name", "Ex: Northeastern University"),
                                       textInput("location2", "Location", "Ex: Vancouver"),
                                       selectInput("type2", "Location Type",
                                                   choices = list("On-site" = 1,
                                                                  "Hybrid" = 2,
                                                                  "Remote" = 3),
                                                   selected = "1"),
                                       dateRangeInput("dates2", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                       textAreaInput("description2", "Description", rows = 3)
                                       )
                      )
                      ),
                      conditionalPanel(condition = "input.Working_Time == 3",
                        fluidRow(
                          column(3,
                                 titlePanel("Working Experience 1"),
                                 checkboxInput("currect", "I am currently working in this role", value = FALSE),
                                 textInput("title1", "Title", "Ex: Data Analytics"),
                                 selectInput("Employment1", "Enployment Type",
                                             choices = list("Please select" = "Please select",
                                                            "Self-employed" = "Self-employed",
                                                            "Freelance" = "Freelance",
                                                            "Internship" = "Internship",
                                                            "Contract Full-time" = "Contract Full-time",
                                                            "Permanent Part-time" = "Permanent Part-time",
                                                            "Contract Part-time" = "Contract Part-time",
                                                            "Casual/On-Call" = "Casual/On-Call",
                                                            "Seasonal" = "Seasonal",
                                                            "Permanent Full-time" = "Permanent Full-time",
                                                            "Co-op" = "Co-op"),
                                             selected = "Please select"),
                                 textInput("company1", "Company Name", "Ex: Northeastern University"),
                                 textInput("location1", "Location", "Ex: Vancouver"),
                                 selectInput("type1", "Location Type",
                                             choices = list("On-site" = 1,
                                                            "Hybrid" = 2,
                                                            "Remote" = 3),
                                             selected = "1"),
                                 dateRangeInput("dates1", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                 textAreaInput("description1", "Description", rows = 3)
                                 ),
                          column(3,
                                 titlePanel("Working Experience 2"),
                                 checkboxInput("currect", "I am currently working in this role", value = FALSE),
                                 textInput("title2", "Title", "Ex: Data Analytics"),
                                 selectInput("Employment2", "Enployment Type",
                                             choices = list("Please select" = "Please select",
                                                            "Self-employed" = "Self-employed",
                                                            "Freelance" = "Freelance",
                                                            "Internship" = "Internship",
                                                            "Contract Full-time" = "Contract Full-time",
                                                            "Permanent Part-time" = "Permanent Part-time",
                                                            "Contract Part-time" = "Contract Part-time",
                                                            "Casual/On-Call" = "Casual/On-Call",
                                                            "Seasonal" = "Seasonal",
                                                            "Permanent Full-time" = "Permanent Full-time",
                                                            "Co-op" = "Co-op"),
                                             selected = "Please select"),
                                 textInput("company2", "Company Name", "Ex: Northeastern University"),
                                 textInput("location2", "Location", "Ex: Vancouver"),
                                 selectInput("type2", "Location Type",
                                             choices = list("On-site" = 1,
                                                            "Hybrid" = 2,
                                                            "Remote" = 3),
                                             selected = "1"),
                                 dateRangeInput("dates2", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                 textAreaInput("description2", "Description", rows = 3)
                                 ),
                          column(3,
                                 titlePanel("Working Experience 3"),
                                 checkboxInput("currect", "I am currently working in this role", value = FALSE),
                                 textInput("title3", "Title", "Ex: Data Analytics"),
                                 selectInput("Employment3", "Enployment Type",
                                             choices = list("Please select" = "Please select",
                                                            "Self-employed" = "Self-employed",
                                                            "Freelance" = "Freelance",
                                                            "Internship" = "Internship",
                                                            "Contract Full-time" = "Contract Full-time",
                                                            "Permanent Part-time" = "Permanent Part-time",
                                                            "Contract Part-time" = "Contract Part-time",
                                                            "Casual/On-Call" = "Casual/On-Call",
                                                            "Seasonal" = "Seasonal",
                                                            "Permanent Full-time" = "Permanent Full-time",
                                                            "Co-op" = "Co-op"),
                                             selected = "Please select"),
                                 textInput("company3", "Company Name", "Ex: Northeastern University"),
                                 textInput("location3", "Location", "Ex: Vancouver"),
                                 selectInput("type3", "Location Type",
                                             choices = list("On-site" = 1,
                                                            "Hybrid" = 2,
                                                            "Remote" = 3),
                                             selected = "1"),
                                 dateRangeInput("dates3", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                 textAreaInput("description3", "Description", rows = 3)
                                 
                                 )
                        )
                      ),
                      fluidRow(
                        column(1, offset = 0,
                               actionButton("Previous3", label = "Previous")
                        ),
                        column(1, offset = 9,
                               actionButton("next3", label = "Next")
                        )
                      )
                      
             ),
             #Education 
             tabPanel("Education", value = "education",
                      selectInput("education_Time", "Number of Degree",
                                  choices = list("1"=1,"2"=2), selected = 1),
                      conditionalPanel(condition = "input.education_Time == 1",
                                       titlePanel("Education 1"),
                                       checkboxInput("currect1", "I am currently study in this university", value = FALSE),
                                       textInput("school1", "School", "Ex: Northeastern University"),
                                       selectInput("degree1", "Degree",
                                                   choices = list("Please select" = "Please select",
                                                                  "Bachelor's Degree" = "Bachelor's Degree",
                                                                  "Master's Degree" = "Master's Degree",
                                                                  "PhD's Degree" = "PhD's Degree"),
                                                   selected = "Please select"),                                       
                                       textInput("field1", "Field of study", "Ex: Analytics"),
                                       dateRangeInput("dates1", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                       textInput("grade1", "Grade", value = NULL),
                                       textAreaInput("activities1", "Activities and Societies", rows = 3),
                                       textAreaInput("description1", "Description", rows = 3)
                      ),
                      conditionalPanel(condition = "input.education_Time == 2",
                                       fluidRow(
                                         column(3,
                                                titlePanel("Education 1"),
                                                checkboxInput("currect1", "I am currently study in this university", value = FALSE),
                                                textInput("school1", "School", "Ex: Northeastern University"),
                                                selectInput("degree1", "Degree",
                                                            choices = list("Please select" = 1,
                                                                           "Bachelor's Degree" = 2,
                                                                           "Master's Degree" = 3,
                                                                           "PhD's Degree" = 4),
                                                            selected = "1"),                                                      
                                                textInput("field1", "Field of study", "Ex: Analytics"),
                                                dateRangeInput("dates1", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                                textInput("grade1", "Grade", value = NULL),
                                                textAreaInput("activities1", "Activities and Societies", rows = 3),
                                                textAreaInput("description1", "Description", rows = 3)
                                         ),
                                         column(3,
                                                titlePanel("Education 2"),
                                                checkboxInput("currect2", "I am currently study in this university", value = FALSE),
                                                textInput("school2", "School", "Ex: Northeastern University"),
                                                selectInput("degree2", "Degree",
                                                            choices = list("Please select" = 1,
                                                                           "Bachelor's Degree" = 2,
                                                                           "Master's Degree" = 3,
                                                                           "PhD's Degree" = 4),
                                                            selected = "1"),                                                      
                                                textInput("field2", "Field of study", "Ex: Analytics"),
                                                dateRangeInput("dates2", "Start date to End date", start = "2020-01-01", end = "2023-03-01"),
                                                textInput("grade2", "Grade", value = NULL),
                                                textAreaInput("activities2", "Activities and Societies", rows = 3),
                                                textAreaInput("description2", "Description", rows = 3)
                                         )
                                       )
                      ),
                      
                      fluidRow(
                        column(1, offset = 0,
                               actionButton("Previous4", label = "Previous")
                        ),
                        column(1, offset = 9,
                               actionButton("save", label = "Save")
                        )
                      )
                      
                      
             )
        
      )
    ),
    
    #resume and cover letter
    tabItem(tabName = "resume", 
            fluidRow(
              column(4,
                titlePanel("Uplode Resume"),
                fileInput("upresume", " ", accept = ".pdf"),
                helpText("Note: Your resume should be around one to two page.")
                
              ),
              column(4,
                titlePanel("Uplode Cover Letter"),
                fileInput("upresume", " ", accept = ".pdf"),
                helpText("Note: Your cover letter should be within one page.")
              )
            )
    ),
    tabItem(tabName = "confirm",
            helpText("Note: Make sure everything is correct and uploaded."),
            hr(),
            hr(),
            tableOutput("values"),
            actionButton("submit", label = "Submit")
      
    ),
    tabItem(tabName = "contact",
            titlePanel("Get contact with us:"),
            textInput("name", "Your Name:", value = NULL),
            textInput("email", "Your Email:", value = NULL),
            textAreaInput("message", "Message:", row =5),
            helpText("Note: If you want to contact us by email, please email ...@northeastern.edu."),
            actionButton("contact-submit", label = "Submit")
    )
    )
  )
)

server <- function(input, output, session) {
  #States and country
  observeEvent(input$country,{
    updateSelectInput(session,
                      'states',
                      choices=unique(city$State[city$Country==input$country]))
  })
  
  #Next button for basic infor
  observeEvent(input$next1, {
    updateNavbarPage(session,
                     inputId="t1",
                     selected="address")
  })
  
  #Previous and Next button for Address
  observeEvent(input$Previous2, {
    updateNavbarPage(session,
                     inputId="t1",
                     selected="bacis")
  })
  
  observeEvent(input$next2, {
    updateNavbarPage(session,
                     inputId="t1",
                     selected="working")
  })
  
  #Previous and Next button for Working
  observeEvent(input$Previous3, {
    updateNavbarPage(session,
                     inputId="t1",
                     selected="address")
  })
  
  observeEvent(input$next3, {
    updateNavbarPage(session,
                     inputId="t1",
                     selected="education")
  })
  
  #Previous button for Education
  observeEvent(input$Previous4, {
    updateNavbarPage(session,
                     inputId="t1",
                     selected="working")
  })
  
  #Value output
  sliderValues1 <- reactive({
    
    data.frame(
      Elements = c("First Name",
               "Last Name",
               "Date of Birth",
               "Gender Pronouns",
               "Headline",
               "Street",
               "ZIP/Postal Code",
               "City",
               "State",
               "Country",
               "Number of Working Experience",
               "Number of Education Experience"),
      Value = c(input$FName,
                input$LName,
                as.character.Date(input$birthday),
                input$pronouns,
                input$headline,
                input$street,
                input$code,
                input$city,
                input$states,
                input$country,
                input$Working_Time,
                input$education_Time
                             
                             ),
      stringsAsFactors = FALSE)
    
  })
  

  # Show the values in an HTML table ----
  output$values <- renderTable({
    sliderValues1()
  })
  

}

shinyApp(ui, server)






