# Basic Counting Techniques 

Everything here rests on two rules for breaking a counting problem into smaller ones. The whole game is deciding which applies.

- **Product Rule** (2.1.3, 2.1.5) — the outcome is built from several aspects chosen _in sequence_: "pick a shirt **and then** a pair of pants." Multiply the counts: $N = \prod_{i=1}^{k} n_i$. Needs each $n_i$ to be the same no matter how the earlier aspects turned out.

- **Sum Rule** (2.2.4) — the outcomes split into _alternative cases_: "the student is **either** a junior **or** a senior." Add the counts: $N = \sum_{i=1}^{k} n_i$. Needs the cases to be disjoint and exhaustive, so every outcome lands in exactly one.

Both rules are stated for two parts first, then extended to $k$ by induction. Each has a hypothesis that quietly fails in practice — a product where later counts depend on earlier choices, or a sum where the cases overlap — and those failures are where the counting goes wrong, so they get their own sections below.

---


> [!thm|b t] 2.1.3 Product Rule
> If a choice is made in two steps, with $n_1$ options for the first step and $n_2$ options for the second step (no matter how the first turned out), then there are $n_1 n_2$ total outcomes.

Each of the $n_1$ first-step choices branches into the same $n_2$ second-step choices, so the leaves of the tree count the outcomes. With $n_1 = 3$ shirts and $n_2 = 2$ pants:

```tikz
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}[
    x=1cm, y=1cm,
    box/.style={draw, rounded corners=2pt, inner sep=4pt, font=\small},
    leaf/.style={draw, rounded corners=6pt, inner sep=4pt, font=\small}]

  \node (root) at (0,0) [circle, draw, inner sep=2pt] {};

  \node (s1) at (3,2.6)  [box] {shirt 1};
  \node (s2) at (3,0)    [box] {shirt 2};
  \node (s3) at (3,-2.6) [box] {shirt 3};

  \node (a1) at (7.4,3.3)  [leaf] {(1, jeans)};
  \node (a2) at (7.4,1.9)  [leaf] {(1, slacks)};
  \node (b1) at (7.4,0.7)  [leaf] {(2, jeans)};
  \node (b2) at (7.4,-0.7) [leaf] {(2, slacks)};
  \node (c1) at (7.4,-1.9) [leaf] {(3, jeans)};
  \node (c2) at (7.4,-3.3) [leaf] {(3, slacks)};

  \draw[->] (root) -- (s1);
  \draw[->] (root) -- (s2);
  \draw[->] (root) -- (s3);

  \draw[->] (s1) -- (a1);
  \draw[->] (s1) -- (a2);
  \draw[->] (s2) -- (b1);
  \draw[->] (s2) -- (b2);
  \draw[->] (s3) -- (c1);
  \draw[->] (s3) -- (c2);

  \node at (3,4.4)   [font=\small] {$n_1 = 3$ branches};
  \node at (7.4,4.4) [font=\small] {$n_2 = 2$ from each};
\end{tikzpicture}
\end{document}
```

> [!thm|b t] 2.1.5 (Product Rule for many aspects)
> Suppose a choice is built out of $k$ aspects made in order. If there are $n_1$ options for the first aspect, and for each $i$ there are $n_i$ options for the $i$-th aspect **no matter how aspects $1, \dots, i-1$ turned out**, then the total number of outcomes is
> $$N = n_1 n_2 \cdots n_k = \prod_{i=1}^{k} n_i.$$

Three things to be careful about in the notation:

- The index runs over the **integers** $1, \dots, k$, so write $i \in \{1, \dots, k\}$ rather than $i \in [1,k]$ — the latter is the real interval and includes things like $i = 1.5$.
- The product is indexed by $i$ and stops at $k$: $\prod_{i=1}^{k} n_i$. Writing $\prod_{n=1}^{\infty} n_i$ mismatches the index variable and never terminates.
- The $n_i$ are _fixed counts_, not objects you have to assert the existence of. There is no $\exists$ here; $n_i$ is just defined as the number of options at aspect $i$.

So the clean statement is: given $n_1, \dots, n_k \in \mathbb{N}$ with $n_i$ the number of options at aspect $i$, the total is $N = \prod_{i=1}^{k} n_i$.

### Why it follows from the two-aspect case

Induct on $k$. For $k = 1$ the claim is $N = n_1$, which is just the definition. Suppose it holds for $k-1$ aspects, so the first $k-1$ aspects produce $n_1 n_2 \cdots n_{k-1}$ partial outcomes. Now treat "everything decided so far" as a single first aspect and the $k$-th aspect as the second. The two-aspect Product Rule applies, since aspect $k$ offers $n_k$ options regardless of which partial outcome we are extending, and gives

$$N = \underbrace{(n_1 n_2 \cdots n_{k-1})}_{\text{first aspect}} \cdot \underbrace{n_k}_{\text{second aspect}} = \prod_{i=1}^{k} n_i.$$

In tree terms: each additional aspect replaces every leaf with $n_k$ new leaves, multiplying the leaf count by $n_k$.

### The condition that can fail

The rule needs $n_i$ to be the same for every way the earlier aspects could have gone — only the _count_ has to match, not the options themselves. Choosing a 4-character password from 26 letters gives $26^4$, because each position offers 26 letters regardless of the earlier ones. But choosing 4 **distinct** letters is not $26^4$; the counts shrink to $26 \cdot 25 \cdot 24 \cdot 23$. That is still a product, because the count at each step is the same no matter _which_ letters were used before — only how many.

> [!pf|t] Counting license plates
> A plate is 3 letters followed by 3 digits, repeats allowed. Here $k = 6$ with $n_1 = n_2 = n_3 = 26$ and $n_4 = n_5 = n_6 = 10$, so
> $$N = \prod_{i=1}^{6} n_i = 26^3 \cdot 10^3 = 17{,}576{,}000.$$

> [!thm|b t] 2.2.4 (Sum Rule)
> Suppose the outcomes you are counting can be split into $k$ cases such that every outcome falls into **exactly one** case. If case $i$ contains $n_i$ outcomes, then the total number of outcomes is
> $$N = n_1 + n_2 + \cdots + n_k = \sum_{i=1}^{k} n_i.$$

### Reading the statement

"Exactly one" is doing two jobs at once, and it is worth separating them:

- **At least one** (the cases are _exhaustive_): no outcome is missed, so nothing is left uncounted.
- **At most one** (the cases are _disjoint_, or mutually exclusive): no outcome appears in two cases, so nothing is counted twice.

A family of cases satisfying both is called a **partition** of the set of outcomes. In set notation, if $S$ is the set of all outcomes and $A_1, \dots, A_k$ are the cases, the hypothesis is
$$S = A_1 \cup A_2 \cup \cdots \cup A_k \quad\text{and}\quad A_i \cap A_j = \varnothing \text{ for } i \neq j,$$
and the conclusion is $|S| = \sum_{i=1}^{k} |A_i|$, where $n_i = |A_i|$.

### Sum vs. Product

The two rules answer different questions, and the giveaway is whether the cases are alternatives or stages:

|           | Sum Rule                      | Product Rule                              |
| --------- | ----------------------------- | ----------------------------------------- |
| Structure | one choice, split into cases  | several aspects chosen in sequence        |
| Keyword   | "either $\dots$ or"           | "and then"                                |
| Requires  | cases disjoint and exhaustive | each $n_i$ independent of earlier choices |
| Result    | $\sum_{i=1}^{k} n_i$          | $\prod_{i=1}^{k} n_i$                     |

### When disjointness fails

If the cases overlap, the sum overcounts every outcome by the number of cases containing it. Counting the integers in $\{1, \dots, 100\}$ divisible by 2 or by 3 as $50 + 33 = 83$ is wrong, because the 16 multiples of 6 land in both cases and get counted twice. The repair is inclusion–exclusion:
$$|A \cup B| = |A| + |B| - |A \cap B| = 50 + 33 - 16 = 67.$$
The Sum Rule is exactly the special case where $|A \cap B| = 0$, so the correction term vanishes.

> [!pf|t] Counting a committee choice
> A club has 12 juniors and 9 seniors, and must send exactly one student to a conference. A choice is either a junior or a senior, never both, and there is no third possibility — so the cases partition the outcomes and $N = 12 + 9 = 21$.
>
> Contrast: if the club sends one junior **and** one senior, that is two aspects rather than two cases, giving $12 \cdot 9 = 108$.

The two readings look different on the page. Adding splits one bar into disjoint pieces; multiplying builds a grid of pairs:

```tikz
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}[x=1cm, y=1cm, font=\small]

  % ---------- Sum Rule: one student, two disjoint cases ----------
  \node at (3.5,3.5) {\textbf{Sum: one student}};

  \draw[rounded corners=3pt] (0,0) rectangle (7,2.6);
  \draw (4,0) -- (4,2.6);

  \node at (2.0,1.5)  {12 juniors};
  \node at (2.0,0.9)  {$n_1 = 12$};
  \node at (5.5,1.5)  {9 seniors};
  \node at (5.5,0.9)  {$n_2 = 9$};

  \node at (3.5,2.95) {$S$ = all possible choices};
  \node at (3.5,-0.9) {$N = 12 + 9 = 21$};

  % ---------- Product Rule: one of each, a grid of pairs ----------
  \node at (11.5,3.5) {\textbf{Product: one of each}};

  \draw[step=0.25] (10,0.175) grid (13,2.425);

  \draw[<->] (10,-0.25) -- (13,-0.25)
        node[midway, below] {12 juniors};
  \draw[<->] (9.65,0.175) -- (9.65,2.425)
        node[midway, left] {9 seniors};

  \node at (11.5,-0.9) {$N = 12 \cdot 9 = 108$};

\end{tikzpicture}
\end{document}
```

On the left, the bar is cut into two pieces that neither overlap nor leave a gap — that is the partition, and the total is the combined length. On the right, every one of the $12 \cdot 9$ little squares is a distinct (junior, senior) pair, so the total is an area rather than a length.
p
# Permutations, Combinations, and the Binomial Theorem

Three ideas, and one question that separates the first two: **does the order of the chosen objects matter?**

- **Permutation** (3.1) — order matters. Line up $r$ of the $n$ objects: $n(n-1)\cdots(n-r+1) = \frac{n!}{(n-r)!}$ ways, or $n!$ when all of them are used.
- **Combination** (3.2) — order does not. Take a *subset* of $r$ of the $n$ objects: $\binom{n}{r} = \frac{n!}{r!\,(n-r)!}$ ways. Same count as the permutations, divided by the $r!$ orderings that each subset was counted under.
- **Binomial Theorem** (3.3) — that same $\binom{n}{r}$ reappears as an algebraic coefficient, $(a+b)^n = \sum_{r=0}^{n} \binom{n}{r} a^r b^{n-r}$, because multiplying out means choosing which $r$ of the $n$ factors hand over their $a$.

All three run on the Product Rule from the previous section. The only new move is deliberately overcounting and then dividing the overcount back out.

---

> [!def|b t] Permutation
> A **permutation** of $n$ objects is an arrangement of all $n$ of them into an ordered line: a first object, a second, and so on through the $n$-th.
>
> More generally, let $r, n \in \mathbb{N}$ with $1 \leq r \leq n$. An ***$r$-permutation*** of $n$ objects is an arrangement of $r$ of those objects into an ordered line — you both **choose** which $r$ objects appear and **decide the order** they appear in. A permutation is the case $r = n$.

Two arrangements of the same objects in different orders are different permutations: order is what is being counted. Building the line one position at a time, the first position has $n$ objects to choose from, the second has $n - 1$ left, and so on, so by the Product Rule the count is $n(n-1)\cdots(n-r+1)$. With $n = 5$ objects and $r = 3$ positions:

```tikz
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}[
    x=1cm, y=1cm, font=\small,
    obj/.style={draw, circle, inner sep=2.5pt},
    slot/.style={draw, rounded corners=2pt, minimum width=1.3cm, minimum height=0.9cm}]

  % ---------- the pool of n = 5 objects ----------
  \node at (4,4.6) {$n = 5$ objects to draw from};

  \node (pa) at (1.2,3.6) [obj] {$a$};
  \node (pb) at (2.6,3.6) [obj] {$b$};
  \node (pc) at (4.0,3.6) [obj] {$c$};
  \node (pd) at (5.4,3.6) [obj] {$d$};
  \node (pe) at (6.8,3.6) [obj] {$e$};

  % ---------- the r = 3 ordered positions ----------
  \node (s1) at (2.0,0.8) [slot] {$c$};
  \node (s2) at (4.0,0.8) [slot] {$e$};
  \node (s3) at (6.0,0.8) [slot] {$a$};

  \draw[->] (pc) -- (s1);
  \draw[->] (pe) -- (s2);
  \draw[->] (pa) -- (s3);

  \node at (2.0,-0.1) {position 1};
  \node at (4.0,-0.1) {position 2};
  \node at (6.0,-0.1) {position 3};

  \node at (2.0,1.9) {$5$ choices};
  \node at (4.0,1.9) {$4$ left};
  \node at (6.0,1.9) {$3$ left};

  \draw[->] (1.0,-0.8) -- (7.0,-0.8) node[midway, below] {order matters};

  \node at (4,-2.0) {$5 \cdot 4 \cdot 3 = 60$ different $3$-permutations};
\end{tikzpicture}
\end{document}
```

The arrangement drawn is $(c, e, a)$; $(a, c, e)$ uses the same three objects but is a different $3$-permutation.

> [!hum|b t] Inuition
> **You have 5 kids and 3 chairs in a row. How many ways can you seat them?**
>
> Walk down the row and fill one chair at a time. The first chair: any of the **5** kids can sit there. Now one kid is seated, so the second chair only has **4** kids still standing. Then the third chair has **3** left. Each choice multiplies, so $5 \cdot 4 \cdot 3 = 60$.
>
> The chairs are in a *row*, so who sits where matters. Amy–Ben–Cal is not the same seating as Ben–Cal–Amy, even though it's the same three kids. That's the whole point of a permutation: **the order counts as part of the answer.**
>
> If all 5 kids get chairs, that's just "a permutation" ($5 \cdot 4 \cdot 3 \cdot 2 \cdot 1 = 120$). If only $r$ of them do, that's an "$r$-permutation" — you stop multiplying once the chairs run out.
> ```tikz
> \usepackage{tikz}
> \begin{document}
> \begin{tikzpicture}[
>     x=1cm, y=1cm, font=\small,
>     kid/.style={draw, circle, inner sep=1.2pt, font=\scriptsize},
>     picked/.style={draw, very thick, circle, inner sep=1.2pt, font=\scriptsize}]
> 
>   % ---------- who is still standing at each step ----------
>   \node at (2,4.4)  {$5$ kids standing};
>   \node at (6,4.4)  {$4$ left};
>   \node at (10,4.4) {$3$ left};
> 
>   \node (k1) at (0.8,3.4) [picked] {Amy};
>   \node        at (1.6,3.4) [kid] {Ben};
>   \node        at (2.4,3.4) [kid] {Cal};
>   \node        at (3.2,3.4) [kid] {Dot};
>   \node        at (4.0,3.4) [kid] {Eve};
> 
>   \node (k2) at (5.1,3.4) [picked] {Ben};
>   \node        at (5.9,3.4) [kid] {Cal};
>   \node        at (6.7,3.4) [kid] {Dot};
>   \node        at (7.5,3.4) [kid] {Eve};
> 
>   \node (k3) at (9.4,3.4) [picked] {Cal};
>   \node        at (10.2,3.4) [kid] {Dot};
>   \node        at (11.0,3.4) [kid] {Eve};
> 
>   % ---------- three chairs in a row ----------
>   % chair 1
>   \draw[thick] (1.45,0.9) -- (2.55,0.9);
>   \draw[thick] (1.45,0.9) -- (1.45,1.9);
>   \draw (1.50,0.9) -- (1.50,0.4);
>   \draw (2.50,0.9) -- (2.50,0.4);
>   \node (c1) at (2.05,1.25) [kid] {Amy};
> 
>   % chair 2
>   \draw[thick] (5.45,0.9) -- (6.55,0.9);
>   \draw[thick] (5.45,0.9) -- (5.45,1.9);
>   \draw (5.50,0.9) -- (5.50,0.4);
>   \draw (6.50,0.9) -- (6.50,0.4);
>   \node (c2) at (6.05,1.25) [kid] {Ben};
> 
>   % chair 3
>   \draw[thick] (9.45,0.9) -- (10.55,0.9);
>   \draw[thick] (9.45,0.9) -- (9.45,1.9);
>   \draw (9.50,0.9) -- (9.50,0.4);
>   \draw (10.50,0.9) -- (10.50,0.4);
>   \node (c3) at (10.05,1.25) [kid] {Cal};
> 
>   % ---------- one kid sits down at each step ----------
>   \draw[->] (k1) -- (c1);
>   \draw[->] (k2) -- (c2);
>   \draw[->] (k3) -- (c3);
> 
>   \node at (2,-0.1)  {chair 1};
>   \node at (6,-0.1)  {chair 2};
>   \node at (10,-0.1) {chair 3};
> 
>   \node at (6,-1.1) {$5 \cdot 4 \cdot 3 = 60$ ways to seat them};
>   \node at (6,-1.9) {order matters: Amy--Ben--Cal $\neq$ Ben--Cal--Amy};
> 
> \end{tikzpicture}
> \end{document}
> ```


> [!thm|b t] 3.2.3 Number of $r$-combinations
> The number of $r$-combinations of $n$ objects is
> $$\frac{n!}{r!\,(n-r)!}.$$

> [!pf]
> Let $k$ be the number of $r$-combinations of the $n$ objects. Build an $r$-permutation in two steps: choose which $r$ objects to use ($k$ ways), then put those $r$ objects in order ($r!$ ways). By the Product Rule this produces every $r$-permutation exactly once, so
> $$k \cdot r! = \frac{n!}{(n-r)!},$$
> since the previous section counted $n(n-1)\cdots(n-r+1) = \frac{n!}{(n-r)!}$ $r$-permutations. Rearranging, $k = \dfrac{n!}{r!\,(n-r)!}$. $\blacksquare$

> [!key|b t] Notation 3.2.4 and Definition 3.2.5
> Write $\binom{n}{r}$ for the number of $r$-combinations of $n$ objects, read "**$n$ choose $r$**":
> $$\binom{n}{r} = \frac{n!}{r!\,(n-r)!}.$$

The two extreme cases fall straight out of the formula and confirm what the definition already said:
$$\binom{n}{n} = \frac{n!}{n!\,0!} = 1, \qquad \binom{n}{0} = \frac{n!}{0!\,n!} = 1,$$
one way to take everything, one way to take nothing. The formula is also visibly symmetric in $r$ and $n - r$, so $\binom{n}{r} = \binom{n}{n-r}$: choosing which $r$ objects to keep is the same act as choosing which $n - r$ to leave behind.

> [!?|b t] Choosing a committee
> Ten athletes compete in the $1000\,$m speed skating, and three are chosen to form a rules committee. How many ways are there to hand out gold, silver, and bronze?
> > [!check|nb t]- View Solution
> > There are $\frac{10!}{7!} = 10 \cdot 9 \cdot 8 = 720$ ways to hand out gold, silver, and bronze, but a committee is not a podium: Wong–Sajna–Andersen is the same committee whichever way those three medals landed among them. Each committee therefore accounts for $3! = 6$ of the $720$ medal outcomes, and
> > $$\binom{10}{3} = \frac{10!}{3!\,7!} = \frac{720}{6} = 120$$
> > committees are possible.

> [!hum|b t] Intuition
> **Same 5 kids. This time you are not seating them — you are picking 3 of them for a team. How many teams?**
>
> Start with the answer you already have: $60$ ways to sit 3 of them in a row. But a team has no chairs. Amy–Ben–Cal sitting in that order and Ben–Cal–Amy sitting in that order are two different seatings, and they are the **same team**.
>
> So how much did the seating count overcount by? Any 3 kids can be seated in $3 \cdot 2 \cdot 1 = 6$ orders, so every team got counted exactly $6$ times. Divide it back out: $60 \div 6 = 10$ teams.
>
> > [!key|nb t] That is the only difference between the two ideas. 
> > **Permutation: chairs in a row, order counts. Combination: a huddle, order does not.**
> ```tikz
> \usepackage{tikz}
> \begin{document}
> \begin{tikzpicture}[
>     x=1cm, y=1cm, font=\small,
>     kid/.style={draw, circle, inner sep=1.2pt, font=\scriptsize}]
>
>   % ---------- left: three chairs in a row (order counts) ----------
>   \node at (2.6,3.0) {in a row: $60$ ways};
>
>   \draw[thick] (0.7,0.9) -- (1.7,0.9);
>   \draw[thick] (0.7,0.9) -- (0.7,1.7);
>   \draw (0.75,0.9) -- (0.75,0.45);
>   \draw (1.65,0.9) -- (1.65,0.45);
>   \node at (1.25,1.22) [kid] {Amy};
>
>   \draw[thick] (2.1,0.9) -- (3.1,0.9);
>   \draw[thick] (2.1,0.9) -- (2.1,1.7);
>   \draw (2.15,0.9) -- (2.15,0.45);
>   \draw (3.05,0.9) -- (3.05,0.45);
>   \node at (2.65,1.22) [kid] {Ben};
>
>   \draw[thick] (3.5,0.9) -- (4.5,0.9);
>   \draw[thick] (3.5,0.9) -- (3.5,1.7);
>   \draw (3.55,0.9) -- (3.55,0.45);
>   \draw (4.45,0.9) -- (4.45,0.45);
>   \node at (4.05,1.22) [kid] {Cal};
>
>   \node at (2.6,-0.2) {chair 1, chair 2, chair 3};
>   \node at (2.6,-0.9) {swap two kids $\Rightarrow$ new seating};
>
>   % ---------- the collapse ----------
>   \draw[->, very thick] (5.2,1.1) -- (6.9,1.1);
>   \node at (6.05,1.7) {forget the order};
>   \node at (6.05,0.5) {$\div\, 3! = 6$};
>
>   % ---------- right: one team, no order (a huddle) ----------
>   \node at (8.9,3.0) {as a team: $10$ ways};
>
>   \draw[dashed] (8.9,1.1) circle (1.15);
>   \node at (8.4,1.6) [kid] {Amy};
>   \node at (9.5,1.3) [kid] {Ben};
>   \node at (8.8,0.5) [kid] {Cal};
>
>   \node at (8.9,-0.2) {no chairs, just a group};
>   \node at (8.9,-0.9) {swap two kids $\Rightarrow$ same team};
>
>   \node at (5.7,-2.0) {$\frac{5!}{3!\,2!} = \frac{60}{6} = 10$};
>
> \end{tikzpicture}
> \end{document}
> ```

## The Binomial Theorem

Here is where $\binom{n}{r}$ shows up on its own, with nobody choosing a committee. Take
$$(a+b)^4 = (a+b)(a+b)(a+b)(a+b).$$
To multiply this out, you walk across the four factors and take either the $a$ or the $b$ from each one; every distinct string of choices contributes one term. There are $2^4 = 16$ such strings, so there are $16$ terms before anything is collected — but they are not $16$ *different* terms. Taking $a, a, b, b$ and taking $b, b, a, a$ both give $a^2b^2$. What survives is a count: the coefficient of $a^r b^{4-r}$ is **the number of strings with exactly $r$ $a$'s**, which is the number of ways to choose *which $r$ of the $4$ factors donate their $a$* — and that is $\binom{4}{r}$.

Sorting all $16$ strings by how many $a$'s they contain makes the coefficients appear:

```tikz
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}[x=1cm, y=1cm, font=\small]

  % ---------- column headings: the term each group collects into ----------
  \node at (1.0,3.6)  {$b^4$};
  \node at (3.4,3.6)  {$ab^3$};
  \node at (5.8,3.6)  {$a^2b^2$};
  \node at (8.2,3.6)  {$a^3b$};
  \node at (10.6,3.6) {$a^4$};

  \node at (1.0,2.95)  {$1$ way};
  \node at (3.4,2.95)  {$4$ ways};
  \node at (5.8,2.95)  {$6$ ways};
  \node at (8.2,2.95)  {$4$ ways};
  \node at (10.6,2.95) {$1$ way};

  \draw (0.2,2.65) -- (11.4,2.65);

  % ---------- r = 0: take b from every factor ----------
  \node at (1.0,2.25) {\texttt{bbbb}};

  % ---------- r = 1 ----------
  \node at (3.4,2.25) {\texttt{abbb}};
  \node at (3.4,1.70) {\texttt{babb}};
  \node at (3.4,1.15) {\texttt{bbab}};
  \node at (3.4,0.60) {\texttt{bbba}};

  % ---------- r = 2 ----------
  \node at (5.8,2.25) {\texttt{aabb}};
  \node at (5.8,1.70) {\texttt{abab}};
  \node at (5.8,1.15) {\texttt{abba}};
  \node at (5.8,0.60) {\texttt{baab}};
  \node at (5.8,0.05) {\texttt{baba}};
  \node at (5.8,-0.50) {\texttt{bbaa}};

  % ---------- r = 3 ----------
  \node at (8.2,2.25) {\texttt{aaab}};
  \node at (8.2,1.70) {\texttt{aaba}};
  \node at (8.2,1.15) {\texttt{abaa}};
  \node at (8.2,0.60) {\texttt{baaa}};

  % ---------- r = 4: take a from every factor ----------
  \node at (10.6,2.25) {\texttt{aaaa}};

  \node at (5.8,-1.3) {each string = one choice per factor; $1+4+6+4+1 = 16 = 2^4$ strings};
  \node at (5.8,-2.0) {a column's height is $\binom{4}{r}$: which $r$ factors donate the $a$};

\end{tikzpicture}
\end{document}
```

Reading the column heights off the picture,
$$(a+b)^4 = \binom{4}{0}b^4 + \binom{4}{1}ab^3 + \binom{4}{2}a^2b^2 + \binom{4}{3}a^3b + \binom{4}{4}a^4 = b^4 + 4ab^3 + 6a^2b^2 + 4a^3b + a^4.$$
(Written in the usual order, that is $a^4 + 4a^3b + 6a^2b^2 + 4ab^3 + b^4$ — the same five terms read right to left.)

Nothing about the argument used the number $4$, which gives the general statement.
[!thm] Bionomial Theorem
For any $a,b,n \in \mathbb{N}$ we have the following relationship:
$$
    (a+b)^n = \sum_{r=0}^{n} \left( \begin{array}{ccc} n \\ r \end{array} \right) a^r b^{n-r}
$$ 

> [!thm|b t] 3.3.2 Binomial Theorem
> For **any** $a$ and $b$, and any natural number $n$,
> $$(a+b)^n = \sum_{r=0}^{n} \binom{n}{r} a^r b^{n-r}.$$
> Taking $a = x$ and $b = 1$ gives the special case
> $$(1+x)^n = \sum_{r=0}^{n} \binom{n}{r} x^r.$$

> [!pf]
> Expanding $(a+b)^n = \underbrace{(a+b)(a+b)\cdots(a+b)}_{n \text{ factors}}$ means choosing an $a$ or a $b$ from each of the $n$ factors, in every possible way, and adding the resulting products. A choice that takes the $a$ from exactly $r$ factors contributes $a^r b^{n-r}$, so the coefficient of $a^r b^{n-r}$ is the number of ways to pick which $r$ of the $n$ factors supply the $a$ — the $b$'s then come from the other $n-r$, with no further choice to make. By Theorem 3.2.3 there are $\binom{n}{r}$ such picks. Letting $r$ run from $0$ to $n$ covers every choice exactly once. $\blacksquare$
>
> For the special case, $1^{\,n-r} = 1$ kills the second factor in every term.

> [!def|b t] 3.3.3 Binomial coefficient
> Because of the role they play here, the numbers $\binom{n}{r}$ are called **binomial coefficients**.

A few things worth reading off the statement:

- **$a$ and $b$ are unrestricted.** Only $n$ has to be a natural number — it is the number of factors, so it must be a count. The $a$ and $b$ can be any numbers at all (or polynomials, or matrices that commute), because the proof never does anything with them but multiply.
- **The exponents always sum to $n$.** Each factor hands over exactly one letter, so the $r$ $a$'s and the $n-r$ $b$'s account for all $n$ of them. This is a fast way to catch an error in an expansion.
- **The coefficients are symmetric**, since $\binom{n}{r} = \binom{n}{n-r}$: choosing which factors give the $a$ is the same act as choosing which give the $b$. That is why $1, 4, 6, 4, 1$ reads the same backwards.
- **Setting $a = b = 1$** turns the theorem into $\sum_{r=0}^{n} \binom{n}{r} = 2^n$ — the $16$ strings in the picture, counted twice over.

> [!hum|b t] Intuition
> **Why does a counting number end up in front of $a^2b^2$?**
>
> Multiplying out $(a+b)(a+b)(a+b)(a+b)$ by hand is just this: go to each of the four brackets and grab one letter. Do that in every possible way, write down all $16$ results, and pile up the ones that look alike.
>
> The pile labeled $a^2b^2$ contains every way of grabbing the $a$ from two brackets and the $b$ from the other two. Nobody cares *which* two brackets gave the $a$ — the answer is $a^2b^2$ either way — so what you are counting is the number of $2$-element subsets of $4$ brackets. That is $\binom{4}{2} = 6$, and $6$ is the coefficient.
>
> So the coefficient is not an algebra fact that happens to look like a combination. **It is a combination**: the number of ways of choosing where the $a$'s came from.
