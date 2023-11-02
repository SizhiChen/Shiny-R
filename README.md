# Shiny-R

By developing this App, I learned from Linkedin, the most popular job-finding website, to make our App look professional.
![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/7e2d7b7b-f06d-4c7c-a0ac-11dbb58410f2)
![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/daed0068-d9e8-4aac-8766-6fc9c43fcf88)

For the opening page of our App, we designed 3 main features. First, on the left side, we have a sidebar menu, which includes four different user interfaces. They are “Personal Information”, “Resume & Cover Letter”, “Confirmation”, and “Contact Us”. Then, there is a small button,![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/39f24c26-952b-4df2-ab89-1ab6e13054df), after the title, it will help us to close and show the sidebar menu. Lastly, we still set a button on the right top corner,![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/31e8b41e-3163-4ab0-b6f1-e6640f22fb99). This button will directly open our LinkedIn profile. For right now, we set it to open Sizhi Chen’s LinkedIn profile (one of our group members).

# A.	Personal Information
#### 1.	Basic Information
In personal information, we have 4 different pages. They are “Basic Information”, “Current Address”, “Working Experience”, and “Education”. For those 4 pages, we all implement different functions to make sure they are working and they are connected to each other.
![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/22174754-895f-4c0a-819b-dc8744f09de3)
In “Basic Information”, we allow the user to enter their First Name, Last Name, and Headline. Also, they are available to choose their date of birth and gender pronouns. Both functions are help for them to complete their personal information.

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/0171882d-eb40-40cb-9cc4-c3429e5e06f6)![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/0fb27d35-812f-4b48-b5f2-178e1b9f4eb3)

Lastly, as the first screenshot shows, the next button on the bottom right side will help us to get to the next page, which is “Current Address”. We achieve this by using the “observeEvent” function in the server part.

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/a5594567-104a-4e5c-bea7-d51f0a077847)

#### 2.	Current Address
In Current Address, we have 5 different elements, “Country”, “States”, “City”, “Street”, and “Zip/Postal Code”. 

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/8364eb65-01f2-492d-b345-2b22b87b71a3)

The “Country” and the “States” are related to each other. When we choose the US as the country, the “States will show all the United States" States. However, when we choose CA as a country, we will have all the Canadian provinces, in the State select box. 

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/f02efeb8-bdf3-49cc-a1a9-f1f17a1b0cc0)![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/33733c5f-3248-4189-bd79-f623a3efcc98)

We achieve this also by using the observeEvent function. I put a data set before we started running the app, and this data set contains all the states and provinces in the US and Canada. Then, what I need to do is use an observeEvent function to let the “State” show different states by country. Here is the code:

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/461b9f76-d1af-43db-b55d-897c5280e860)

Lastly, same with the first page, the Previous and the Next button are available for us to jump into the first page, “Basic Information”, and the third page, “Working Experience”.

#### 3.	Working Experience
On the third page, same as the previous pages, we set up the button “Previous” and the button “Next” to change the page.

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/5edb2af9-e23e-484a-97d8-96840e7eb81d)

However, the most interesting part will be the “Number of Working Experience”, we give people three choices, 1, 2, or 3 different working experiences.

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/e692c06c-314b-45cd-934d-e37c81803489)

By selecting the different number of working experiences, the app will show you the different number of spaces to fill in your working experience. As the screenshot shows below:

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/c580cdcb-e4a4-4012-95c0-d8d5d76d26ed)

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/b280302a-0d3f-4c64-97e9-4aefd1888504)

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/da4572ea-96cc-4ac9-b824-164680d0b181)

For each of working experience, first, it is available to check whether the applicant is currently working here. Also, we give the same different employment types to choose from:

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/b1856061-74d7-452b-bc58-0f101169339c)

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/9cb13b34-1315-4466-9a5a-6778eede70bf)

Moreover, we have three types of Location Type, “On-site”, “Hybrid”, and “Remote”. Most importantly, we learn it from the LinkedIn profile page.

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/c22a1886-6754-4452-8189-11bf1cdb291c)

#### 4.	Education
Lastly, for the education part, we create the same user interface. The previous button here is helping us go back to the working experience page. The “Save” button is meant to help us have the data we inputted.

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/cb13b563-7b69-464b-9d05-83df5545fe18)

Same with the “Working Experience” page, we give applicants choices for the number of degrees, 1 and 2. Also, same with the last page, will show the different number of spaces for people to save your education experience. 

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/6c5f4eb9-19ff-46c4-a6d2-3d4749b379a9)

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/9015b9dd-150f-4fd0-8381-5e6c126106de)

Lastly, in the degree selection box, we give 3 options, “Bachelor’s Degree”, “Master’s Degree”, and “Ph.D. Degree”. All others are similar to the previous pages.

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/c8a748ac-b900-4eed-a55c-107e9082f854)

# B.	Resume & Cover Letter

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/9a3aaceb-47be-4322-ad78-7290352af3c2)

For resume and cover letter, we allow applicants to upload their Resumes and Cover Letters, only in PDF version. Also, we give a note that “Your resume should be around one to two pages.” And “Your cover letter should be within one page.”

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/563f7554-ffab-4f16-9359-a1e692619fd0)

When we open the Browse, we can see that we are only able to choose PDF versions of documents.

# C.	Confirmation

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/02d0072c-e86d-465f-a87c-7993caf95793)

For Confirmation, it just helps people make sure everything is correct and down. And then they could submit it. All the values in confirmation will change, while a person is editing the “Personal Information”.

For example, if I fill in all my personal information, then it will look like this:

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/0672526a-ab13-4246-a306-b3309c989fe0)

# D.	Contact Us

![image](https://github.com/SizhiChen/Shiny-R/assets/46178324/d933e517-0b66-4ef8-801d-afceeae6e760)

The contact us page just help the applicant to contact us. Also, we put a note that “If you want to contact us by email, please email ...@northeastern.edu.” 
























