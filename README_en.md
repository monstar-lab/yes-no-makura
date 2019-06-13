# Summary for yes-no-makura app
It is an application which display questions with valid answers in realtime. The questions will be displayed on a monitor or a projector and the respondent is expected to answer the questions with "yes" or "no" from a terminal such as smartphone or tablet.

## Setup development environment
1. pull the project using `git clone URL` command.

1. Since the version of ruby ​​is different for each project, it is necessary to change the version of ruby. We use `rbenv` for this.
Please refer [here](http://vdeep.net/mac-ruby-rubyonrails) for detailed information.

1. Install the required version of ruby by using `rbenv install` command. Since the version is set to `.ruby-version`, the version specification is not necessary.

1. As we changed the version of ruby, reinstall the bundler using  `gem install bundler`.

1. Run `bundle install`

1. Migrate using `rails db:migrate` command

1. Please check the operation by using `rails s`

1. First of all, let's use the app for trial.


## Basic App Usage
### Administrator (Manage and display questions)

 - To access management(admin) screen

    Please use `/admin` to use the app as an administrator ※The route will be displayed on the screen for respondents.


- To create questions:
  1. Click on `QUESTIONS` in the upper right corner of the screen.

  1. The `NEW QUESTION` button will be displayed in the center of the screen.

  1. Click on the `NEW QUESTION` button to move to question registration page

  1. Please enter the question in the Body field

  1. select `init` for State field. (`open` -> open to answer、`close` -> answer completion status)

  1. Click on `Create Question` to register the question.


- Display question:
  1. After registering the  questions, go back to the homepage by clicking on `HOME` from top right corner and press `START`.

  1. The screen displays the questions you have registered. In the meantime, ask the respondents to answer the questions.

  1. Watch the moment and press the `RESULT` button to see the result.

  1. The results will be  displayed on the screen. (The number of people who answered yes is displayed)

  1. Press `Next Question` if you have the next question.

- Edit/Destroy questions
  1. The questions you have registered are displayed in a list.

  1. option 1: click on `Edit` or `Destroy` button from options of each questions in the list. option2: Click on `Show` button of the question and `Edit` it from there.



#### 一Batch operation
- Reset Questions

  Press `INITIALISE ALL` above the table where the questions are displayed in order to change the answer State back to the `init` state.

- Reset Answer Results

  If you want to reset the answer result, please press `RESET ALL ANSWERS` displayed above the table.

- Delete all  Questions

  If you want to delete questions in bulk, press `DELETE ALL` which is displayed above the table.
  ※ count results are also deleted!



### Respondent/Player (Answer to the question)
- Answer to the question
  1. Access the root address from a terminal such as a smartphone or tablet (PC is also acceptable). The answer page is displayed.

  1. An administrator will be projecting questions on a display or a projector. Please press the "yes" or "no" button for that question.
    ※ If the question is not displayed, the answer will not be counted even if you press the button.
  1. When the respondent presses OK and submits the questions, a summary of them is displayed on the administrator's screen.



## [Reference materials] To create issues and pull requests
- [How to write a good issue ?](http://kuroeveryday.blogspot.jp/2015/08/bug-issues.html)
- [How to create a Pull Request?](http://www.atmarkit.co.jp/ait/articles/1702/27/news022.html)
- [Tips for creating a better Pull Request](https://yakst.com/ja/posts/1625)
