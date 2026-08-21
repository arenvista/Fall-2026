#import "template.typ": *
#import "@preview/tablem:0.3.0": tablem, three-line-table

#show: homework.with(
  title: "MATH 302: Homework 1",
  course: "MATH 302",
  author: "Aren Vista",
  date: "September 8, 2025",
)

= Question 1
#question[Show that every normed vector space $(V, norm(dot))$ is automatically a metric space $(V, d)$ with the metric $d$ given by $d(x, y) = norm(x - y)$.]

#definition(title: "1.1 Metric Space Properties")[
  A set is a metric space if it is equipped with a function $d : V times V -> RR$ such that for all $x, y, z in V$:

  #align(center)[#tablem(align: left)[
    | *Property* | *Description* |
    | ------------------------------- | ---------------------------- |
    | I. Identity of Indiscernibles | $d(x,y) = 0 <=> x=y$ |
    | II. Symmetry | $d(x,y) = d(y,x)$ |
    | III. Triangle Inequality | $d(x,y) <= d(x,z) + d(z,y)$ |
    | IV. Non-Negativity | $d(x,y) >= 0$ |
  ]]
]

Let there be a normed vector space $(V, norm(dot))$. Define $d(x, y) = norm(x - y)$. We will show that $d$ satisfies the four properties of a metric space.

== Identity of Indiscernibles

Observe that the "Identity of Indiscernibles" property states that $d(x, y) = 0$ if and only if $x = y$. In other words given $x,y in V$ and the distance between them is zero, then they must be the same point.

By the definition of $d$, we have:
$
d(x,y) = norm(x - y)
$
By the definition of a norm, $norm(v) = 0$ if and only if $v = 0$. Applying this to $v = x - y$:
$
d(x,y) = 0 <=> norm(x - y) = 0 <=> x - y = 0 <=> x = y,
$
where the final step follows by adding $y$ to both sides. Thus, the "Identity of Indiscernibles" property holds. $qed$

== Symmetry

Observe the "Symmetry" property holds if the distance from $x$ to $y$ is the same as the distance from $y$ to $x$. In other words, given $x,y in V$, we have that $d(x,y) = d(y,x)$.

We can test this assertion by substituting the definition of $d$ into the equation:
$
d(x,y) = norm(x - y) = norm(-(y - x)) = norm(y - x) = d(y,x)
$

Thus, the "Symmetry" property holds. $qed$

== Triangle Inequality

Observe the "Triangle Inequality" property states the distance between two points $x$ and $y$ is less than or equal to the sum of the distances from $x$ to a third point $z$ and from $z$ to $y$. In other words, given $x,y,z in V$, we have that $d(x,y) <= d(x,z) + d(z,y)$.

We can test this assertion by substituting the definition of $d$ into the equation:
$
d(x,z) = norm(x - z) and d(z,y) = norm(z - y) and d(x,y) = norm(x - y) \
d(x,z) + d(z,y) = norm(x-z) + norm(z-y) \
$

Observe the following:
$
norm(x - y) = norm((x - z) + (z - y)) <= norm(x - z) + norm(z - y)
$

Thus, the "Triangle Inequality" property holds. $qed$

== Non-Negativity

Observe the "Non-Negativity" property states that the distance between two points $x$ and $y$ is always greater than or equal to zero. In other words, there can never be a negative distance between two points.

As the distance function $d$ is defined as the norm of the difference between two points, we have that $d(x,y) = norm(x - y)$. By the definition of a norm, we know that $norm(v) >= 0$ for all $v in V$. Therefore, $d(x,y) >= 0$ for all $x,y in V$. $qed$

== Conclusion

As we have shown that $d$ satisfies all four properties of a metric space, we conclude that every normed vector space $(V, norm(dot))$ is automatically a metric space $(V, d)$ with the metric $d$ given by $d(x, y) = norm(x - y)$.

= Question 2
#question[On $RR^n$ define, for any $x = (x_1, dots, x_n)$, $ norm(x)_1 = sum_(j=1)^n abs(x_j) quad "and" quad norm(x)_infinity = max{abs(x_1), dots, abs(x_n)}. $ Show that both $norm(x)_1$ and $norm(x)_infinity$ are norms on $RR^n$.]

#definition(title: "Definition of a Norm")[
  An element is a norm if the following is met:

  #align(center)[#tablem(align: left)[
    | *Property*                 | *Description*                      |
    | -------------------------- | ------------------------           |
    | I. Positive Definite       | $norm(x) = 0 <==> x=0$             |
    | II. Absolute Homogeneity    | $norm(a x) = norm(a) norm(x)$      |
    | III. Triangle Inequality   | $norm(x + y) <= norm(x) + norm(y)$ |
  ]]
]

WWTS $norm(x)_1$ and $norm(x)_oo$ maintain these properties on the vector space $RR^n$.

== Positive Definite

Let $p := (norm(x) = 0)$ and $q := (x = 0)$. WWTS $p <==> q$ for both $norm(dot)_1$ and $norm(dot)_oo$.

=== Forward Proof

WWTS $p ==> q$. Equivalently, we prove the contrapositive $not q ==> not p$, that is
$
(x != 0) ==> (norm(x) != 0).
$

Suppose $x = (x_1, dots, x_n) != 0$. Then $x$ differs from the zero vector in at least one coordinate, so there exists an index $a in {1, dots, n}$ with $x_a != 0$. By the properties of absolute value,
$
abs(x_a) > 0 quad "and" quad abs(x_j) >= 0 quad forall j in {1, dots, n}.
$

==== Case $norm(x)_1$

Splitting the sum at the index $a$ and bounding each piece below:
$
#grid(
  columns: 4,
  align: (center, right, center, left),
  column-gutter: 0.35em,
  row-gutter: 0.6em,
  inset: (y: 0.15em),
  [], $0$, $<$, $abs(x_a)$,
  $+$, $0$, $<=$, $scripts(sum)_(j != a) abs(x_j)$,
  grid.hline(stroke: 0.5pt),
  [], $0$, $<$, $scripts(sum)_(j=1)^n abs(x_j) = norm(x)_1$,
)
$

Hence $norm(x)_1 > 0$, and in particular $norm(x)_1 != 0$. $qed$

==== Case $norm(x)_oo$

Since $abs(x_a) in {abs(x_1), dots, abs(x_n)}$ and the maximum of a set is an upper bound for every element of that set,
$
norm(x)_oo = max{abs(x_1), dots, abs(x_n)} >= abs(x_a) > 0.
$

Hence $norm(x)_oo > 0$, and in particular $norm(x)_oo != 0$. $qed$

=== Back Proof

WWTS $q ==> p$. Suppose $x = 0$, so that $x_j = 0$ for every $j in {1, dots, n}$, and therefore $abs(x_j) = 0$ for every such $j$.

==== Case $norm(x)_1$

$
norm(x)_1 = sum_(j=1)^n abs(x_j) = sum_(j=1)^n 0 = 0.
$
Hence $norm(x)_1 = 0$. $qed$

==== Case $norm(x)_oo$

$
norm(x)_oo = max{abs(x_1), dots, abs(x_n)} = max{0, dots, 0} = 0.
$
Hence $norm(x)_oo = 0$. $qed$

=== Conclusion

Both directions hold for each norm, so $norm(x)_1 = 0 <==> x = 0$ and $norm(x)_oo = 0 <==> x = 0$. Thus $norm(dot)_1$ and $norm(dot)_oo$ are both positive definite. $qed$
