# WIKITRAVEL

# TODO - 
    - Add pagination as exploratory
    - Think about more scenarios
    - Report
    - Quandoo learnings
    

# WikiTravel Project
This project is created to verify basics search results flow of Wikipedia website and explore some Currency Exchange areas of Travelex(UK) website.
 
# Framework - Folder Structure

Cucumber is a tool that facilitates Behavior Driven Development(BDD) framework. It acts as a living documentation wherein the scenarios can be written in Gherkin language, a plain text language which keeps Stakeholders, Developers and Testers on the same page in terms of the feature to be developed. 

It focuses on end-users and the scenarios that are priority as per the business domain. The tests are easy to write, maintainable and reusable.

Cucumber execution starts from **support/env.rb** file loading the required gems and adding PageObject/Page Factory to the World object that Cucumber creates supporting **Page-Factory Design Pattern implementation**

Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle. We can put them in any other file under the support directory. In this framework, we have placed in a file called **support/hooks.rb**.

Feature files can be put under **features/** directory with .feature extension. In features, we write scenarios in Gherkin format (Give, When and Then) to ensure the tests are easily readable and do not contains technical jargons. 

Actual code implementation takes place in **step_definitions/** directory having steps to navigate through the scenarios defined in the feature files.

**lib/pages** directory contains the **Page-Object Design Pattern** implementation with each page/component in application defined as a separate page.

**lib/reusable_panels** directory contains the reusable elements that can be used across different pages supporting **Template-Method Design Pattern**.

Different environments like regression, pre-production or tests related to Smoke, Sanity can be defined in **cucumber.yml** file as profiles. In this framework, we create two profiles - **wiki_profile** to run Wikipedia features and **travelex_profile** to run Travelex features.

**Gemfile** contains all the gems that are used within the project and is mentioned with the syntax as ```gem 'gem_name'```

The **Gemfile.lock** file is where Bundler records the exact versions that were installed.

# Framework - Installation Instructions

**_Assuming_** Ruby version > 2.3 is installed in your system along with any IDE say, Ruby Mine that supports Ruby.

To run this framework and its feature scenarios, you will need to have few gems installed beforehand:

```
gem install cucumber
gem install watir
gem install page-object
gem install data_magic
gem install fig_newton
```

```gem page-object``` makes it easier to define page objects and changes as your site changes. This helps us implementing the page object design pattern with ease.

```gem data_magic``` makes it easier to find files that contain the default data. The **config/data** directory is the default directory used by data_magic.

```gem fig_newton``` makes it easier to manage different test environments. It is also common to have to change some of the values we use in our tests as we move from environment to environment. The **config/environments** directory is the default directory used by fig_newton.

# Technology Stack
 
 - **Tools**            :   Cucumber
 - **Language**         :   Ruby
 - **Framework**        :   Behavior Driven Development(BDD)
 - **Web-driver**       :   WATIR (under the hood - SELENIUM)
 - **Patterns**         :   Page-object, Page-Factory, Template, Assertion, Process
 - **Version Control**  :   GIT
 - **Reporting**        :   Cucumber Default Reporting (html)    

# Scenarios - Run Instructions

To run the scenarios included in the feature files, below are the steps:

```
cd /path/to/your/local_code_directory
```

In our case, the root directory is **wikitravel**.

To run **Wikipedia** front end tests:

```
cucumber -p wiki_profile -t @wiki_search_results
```

To run **Wikipedia** Exploratory tests:

```
cucumber -p wiki_profile -t @wiki_exploratory_tests
```

To run **Travelex** front end tests:

```
cucumber -p travelex_profile -t @travelex_slider
```

**Notes:** 
1. Please note a '@scenario_tag' is defined on each scenario in the feature file.
  - To run a specific scenario, use below command:
    
    ```cucumber -p <profile_name> -t @scenario_tag```
        
2. '-p' stands for profiles and is used to define the particular environment in which tests are executed.

 - We have two profiles - **travel_profile** and **wiki_profile**
 - Check **cucumber.yml** file for more details.

3. Tests are implemented and verified with Chrome Browser version 67.0.3396.99 (Official Build) (64-bit) at this moment and Chrome driver 2.35. 
 
 - Will be updated for other browsers(Firefox, IE) in future updates. 


# Reports - HTML Format

**features.report.html** file contains test execution details and status of the scenarios resulting in pass or fail, using Cucumber default reporting format.

To view the report, right-click on **features.report.html** file, hover on 'Open in Browser' option and choose the browser of your choice.
 
**html_report** profile is created in cucumber.yml file to have the reports generated with each execution.

Just use ```-p html_report``` with your cucumber command.  
 
  

- [Read Here!](https://github.com/grosser/parallel_tests) for more details on parallel_tests gem.