# Royal Line of England – Knowledge Base

A knowledge base built entirely in Prolog, storing familial and dynastic information from **Rollo of Normandy** (9th century) through to **King John of England** (13th century). It covers temporal titles held and the dates of associated reigns.

---

## Prerequisites

You will need an implementation of Prolog installed. This project is tested with **SWI-Prolog**.

**Windows & macOS** — Download and install the latest stable release from [swi-prolog.org](https://www.swi-prolog.org/download/stable). During or after installation, ensure the executable is added to your system PATH.

**Linux (Ubuntu/Debian)** — Install via the official PPA:

```bash
sudo apt-add-repository ppa:swi-prolog/stable
sudo apt-get update
sudo apt-get install swi-prolog
```

---

## Getting Started

Clone the repository and move into the project directory:

```bash
git clone https://github.com/mistermunga/Royal-Line-of-England-KB.git
cd Royal-Line-of-England-KB
```

> **Note:** Clone the full repository URL above, not a specific branch or tree link.

Then load the knowledge base:

```bash
swipl main.pl
```

---

## Queries

### Demonstrations

The knowledge base ships with several built-in demo predicates:

```prolog
?- demo.              % Full demonstration of system capabilities
?- showcase.          % Dynastic transitions and what-if succession models
?- plantagenet_tree.  % Plantagenet family tree
?- sample_queries.    % Guided examples to get you started
```

### Example Queries

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

These cover succession rules, inheritance patterns, dynastic membership, and historical timelines.

For a complete reference of all available predicates, run:

```prolog
?- glossary.
```
