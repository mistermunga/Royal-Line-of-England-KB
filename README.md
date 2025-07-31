# Royal Line of England – Knowledge Base

This is a **Knowledge Base built entirely in Prolog** that stores familial and dynastic information from the historical Viking **Rollo of Normandie (9th century)** to **King John of England (13th century)**.

The Knowledge Base also includes information about the **temporal titles** held and the **dates of reigns**.

---

## 📦 Prerequisites

You will need to have an implementation of Prolog installed. This project is tested using **SWI-Prolog**.

### 🖥️ Windows & macOS

1. Download the latest version of SWI-Prolog from their official website:  
   👉 [https://www.swi-prolog.org/download/stable](https://www.swi-prolog.org/download/stable)
2. Install it and **make sure to add the executable to your system PATH**.

### 🐧 Linux (Ubuntu/Debian)

Open a terminal and run:

```bash
sudo apt-add-repository ppa:swi-prolog/stable
sudo apt-get update
sudo apt-get install swi-prolog
````

---

## 🚀 Cloning and Running the Knowledge Base

1. Open your terminal and clone the repository:

```bash
git clone https://github.com/mistermunga/Royal-Line-of-England-KB.git
```

> ⚠️ **Note:** Make sure you are cloning the full repository, not a specific tree or branch URL.

2. Move into the project directory:

```bash
cd Royal-Line-of-England-KB
```

3. Run the main Prolog file:

```bash
swipl main.pl
```

## 🔍 Example Queries & Demos

Once the Knowledge Base is loaded using `swipl main.pl`, you can run a variety of demonstration and analytical queries right out of the box.

### 🚀 Quick Start Demonstrations

- To run a full demonstration of the system's capabilities:

```prolog
?- demo.
````

* To run the full showcase including dynastic transitions and what-if succession models:

```prolog
?- showcase.
```

* To view the Plantagenet family tree:

```prolog
?- plantagenet_tree.
```

* To see sample queries you can try:

```prolog
?- sample_queries.
```

### 🧠 Interesting Queries to Try

```prolog
?- eldest_child(william_the_conqueror, X).
?- agnatic_heir(henry_plantagenet, X).
?- title_holder(duke_of_normandy, X, 1100).
?- contemporary(richard_coeur_de_lion, X).
?- female_inheritance(Parent, Daughter).
?- contested_title(king_of_england, Year, Claimants).
?- reign_length(Person, king_of_england, Years).
?- dynasty(normandie, Members).
```

These queries explore succession, inheritance, dynasties, and timelines of major historical figures.

---

For a complete glossary of all predicates and their usage, run:

```prolog
?- glossary.
```

