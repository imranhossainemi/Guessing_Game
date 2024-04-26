# Guessing_Game

<a name="readme-top"></a>
<div align="center">
  <img src="200w.gif" alt="logo" width="140"  height="auto" />
  <br/>

  <h3><b>Guessing Game</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [Guessing Game] <a name="about-project"></a>

> A generalized rock-paper-scissors game (with the supports of arbitrary odd number of arbitrary combinations).

**[Guessing Game]** is launched with command line parameters it accepts an odd number ≥ 3 non-repeating strings (if the arguments are incorrect, you must display a neat error message—what exactly is wrong and an example of how to do it right). All messages should be in English. These passed strings are moves (for example, Rock Paper Scissors or Rock Paper Scissors Lizard Spock or 1 2 3 4 5 6 7 8 9).

The victory is defined as follows—half of the next moves in the circle wins, half of the previous moves in the circle lose (the semantics of the strings-moves is not important, he plays by the rules build upon the moves order the user used, even if the stone loses to scissors in its order—the contents of the strings-moves are not important for you).

Also generates a cryptographically strong random key  with a length of at least 256 bits, computer makes own's move, calculates HMAC (based on SHA2 or SHA3) from the own move as a message with the generated key, displays the HMAC to the user.

Thus the user can check that the computer plays fair.

When you select the "help" option in the terminal, you need to display a table (ASCII-graphic) that determines which move wins.

    Example:

    HMAC: 9ED68097B2D5D9A968E85BD7094C75D00F96680DC43CDD6918168A8F50DE8507
    Available moves:
    1 - rock
    2 - Spock
    3 - paper
    4 - lizard
    5 - scissors
    0 - exit
    ? - help
    Enter your move: 3
    Your move: paper
    Computer move: rock
    You win!
    HMAC key: BD9BE48334BB9C5EC263953DA54727F707E95544739FCE7359C267E734E380A2

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

> Describe the tech stack and include only the relevant sections that apply to your project.

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://ruby-lang.org/">Ruby</a></li>
  </ul>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

> In order to run this on your local enviourment you need Any ruby version install in you machine.

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

```sh
  install ruby
```

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:imranhossainemi/Guessing_Game.git
```

### Usage

To run the project, execute the following command:

```sh
  cd Guessing_Game
  ruby game.rb rock paper sessior
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👤 Author <a name="authors"></a>

👤 **Author**

- GitHub: [@githubhandle](https://github.com/imranhossainemi)
- Twitter: [@twitterhandle](https://twitter.com/DevImranHossain)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/imran-hossain-emi/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank [Itransition](https://www.itransition.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

_NOTE: we recommend using the [MIT license](https://choosealicense.com/licenses/mit/) - you can set it up quickly by [using templates available on GitHub](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository). You can also use [any other license](https://choosealicense.com/licenses/) if you wish._

<p align="right">(<a href="#readme-top">back to top</a>)</p>
