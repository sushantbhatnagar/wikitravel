# WikiTravel Project
This project is created to verify basics search results flow of Wikipedia website and explore some Currency Exchange areas of Travelex(UK) website.
 
# Framework Design and Implementation

Cucumber is a tool that facilitates Behavior Driven Development(BDD) framework. It acts as a living documentation wherein the scenarios can be written in Gherkin language, a plain text language which keeps Stakeholders, Developers and Testers on the same page in terms of the feature to be developed. 

It focuses on end-users and the scenarios that are priority as per the business domain. The tests are easy to write, maintainable and reusable.

Cucumber execution starts from **support/env.rb** file loading the required gems and adding PageObject/Page Factory to the World object that Cucumber creates supporting **Page-Factory Design Pattern implementation**

Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle. We can put them in any other file under the support directory. In this framework, we have placed in a file called **support/hooks.rb**.

Feature files can be put under **features/** directory with .feature extension. In features, we write scenarios in Gherkin format (Give, When and Then) to ensure the tests are easily readable and do not contains technical jargons.
 
 Wikipedia scenarios are defined under **features/wikipedia** directory and Travelex scenarios are defined under **features/travelex** directory.

Actual code implementation takes place in **step_definitions/** directory having steps to navigate through the scenarios defined in the feature files.

**lib/pages** directory contains the **Page-Object Design Pattern** implementation with each page/component in application defined as a separate page.

**lib/reusable_panels** directory contains the reusable elements that can be used across different pages supporting **Template-Method Design Pattern**.

Different environments like regression, pre-production or tests related to Smoke, Sanity can be defined in **cucumber.yml** file as profiles. In this framework, we create two profiles - **wiki_profile** to run Wikipedia features and **travelex_profile** to run Travelex features.

**Gemfile** contains all the gems that are used within the project and is mentioned with the syntax as ```gem 'gem_name'```

The **Gemfile.lock** file is where Bundler records the exact versions that were installed.

# RSpec:: Unit Test Framework

Since Cucumber with BDD framework involves testing of an End-to-End business logic in an application(SUT), I wanted to test few of the scenarios using RSpec rather than using Cucumber to drive those tests, for this project.

Unit tests are defined under the directory: **/features/wikipedia/unit_tests**.

Tests are still written using Gherkin but that is purely for just this project to demonstrate and are not required if we are using a RSpec framework to drive the tests.

I have included a keyword ```(ph)``` for unit tests at the end of the Gherkin for each scenario. 

The step definition is defined under _features/step_definitions/spec_definition.rb_ file.

**spec** directory in the folder structure contains all the spec tests for the wikipedia application as per wikipedia pages i.e. the landing page and search results page. 

**spec_helper.rb** file contains all the configurations that are required to run the rspec tests.

All unit tests are created in spec.rb files (**wikipedia_landing_page_spec.rb** and **wikipedia_search_results_page_spec.rb**) files which require the spec_helper.rb file having the configurations.
 
# Framework - Set Up Instructions

**_Assuming_** Ruby version > 2.3 is installed in your system along with any IDE say, Ruby Mine that supports Ruby.

To run this framework and its feature scenarios, you will need to have few gems installed beforehand:

```
gem install cucumber
gem install rspec
gem install rake
gem install watir
gem install require_all
gem install page-object
gem install data_magic
gem install fig_newton
```

```gem page-object``` makes it easier to define page objects and changes as your site changes. This helps us implementing the page object design pattern with ease.

```gem data_magic``` makes it easier to find files that contain the default data. The **config/data** directory is the default directory used by data_magic.

```gem fig_newton``` makes it easier to manage different test environments. It is also common to have to change some of the values we use in our tests as we move from environment to environment. The **config/environments** directory is the default directory used by fig_newton.

```gem rspec``` is used for Behavior Driven Development for Ruby. spec is a meta-gem, which depends on the rspec-core, rspec-expectations and rspec-mocks gems. Each of these can be installed separately and loaded in isolation using require.

# Technology Stack
 
 - **Tools**            :   Cucumber
 - **Language**         :   Ruby
 - **Framework**        :   Behavior Driven Development(BDD)
 - **Web-driver**       :   WATIR (under the hood - SELENIUM)
 - **Design Patterns**         :   Page-object, Page-Factory, Template, Assertion, Process
 - **Version Control**  :   GIT
 - **Reporting**        :   Cucumber Default Reporting (html)    

# Scenarios - Run Instructions

To run the scenarios included in the feature files, below are the steps:

```
cd /path/to/your/local_code_directory
```

In our case, the root directory is **wikitravel**.

Once you have installed the gems stated above in Framework Installation Instructions section, run bundle install

```
bundle install
```

Do a rspec init at the root of your project directory:

```
rspec --init
```

You are ready to run tests now. Use below commands:

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

To run Unit test cases created using rspec, run the following commands:

```
rspec spec/wikipedia_landing_page_spec.rb
```

```
rspec spec/wikipedia_search_results_page_spec.rb
```

**Notes:** 
1. Please note a '@scenario_tag' is defined on each scenario in the feature file.
  - To run a specific scenario, use below command:
    
    ```cucumber -p <profile_name> -t @scenario_tag```

2. To run all wikipedia scenarios and travelex scenarios, specific tags are created at a feature file level.
  - To run all wikipedia scenarios, use below command:
    
    ```cucumber -p wiki_profile -t @wiki_tests```
  
  - To run all travelex scenarios, use below command:
      
      ```cucumber -p travelex_profile -t @travelex_tests```
        
3. '-p' stands for profiles and is used to define the particular environment in which tests are executed.

 - We have two profiles - **travel_profile** and **wiki_profile**
 - Check **cucumber.yml** file for more details.

4. Tests are implemented and verified with Chrome Browser version 67.0.3396.99 (Official Build) (64-bit) at this moment and Chrome driver 2.35. 
 
 - Will be updated for other browsers(Firefox, IE) in future updates.
  
5. The second scenario ```rspec spec/wikipedia_search_results_page_spec.rb``` was tested when the WIKI search results server was down. This test case might fail at the time you are trying to run it. I will shortly embed the execution result screen for this scenario.

# Reports - Default HTML Format

Reports should be generated with file names as **wiki_features_report.html** and **travelex_features_report.html** for wikipedia and travelex scenarios respectively, every time you run a scenario/feature.

To view the report, right-click on any of the html file, hover on 'Open in Browser' option and choose the browser of your choice.
 
**wiki_html_report** and **travelex_html_report** profiles are created in cucumber.yml file to have the reports generated with each execution.

To generate the html report, use below profile either in Command line or embed the profile with wiki_profile or travelex_profile

 ```wiki_html_report```  or  ```travelex_html_report```

# Future Enhancements

- Run tests with Firefox and IE web browsers.
- Remove the browser invoke functionality for unit tests.