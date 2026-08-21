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
		| IV. Non-Negatitivity | $d(x,y) >= 0$ |
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
		| II. Absolute Homogenity    | $norm(a x) = norm(a) norm(x)$      |
		| III. Triangle Inequality   | $norm(x + y) <= norm(x) + norm(y)$ |
	]]
]

WWTS $norm(x)_1$ and $norm(x)_oo$ maintain these properties on the metric space $RR^n$

== Positive Definite

Let $p:= (norm(x)= 0)$ and $q:=(x=0)$  

=== Forward Proof
WWTS $p ==> q equiv ~p or q equiv (norm(x)!=0) ==> (x=0)$ 

==== Case $norm(x)_1$
Consider $norm(x)_1 != 0$. Thus it follows by subsitution:
$ norm(x)_1 = sum_(j=1)^n abs(x_j) = 0 $

As $forall x, x in RR$ it follows then $forall |x|, 0 <= |x|$  by the properties of absolute values.

WLOG Let $x_a, x_b in {x_1,..,x_n}$. Observe the following:
$
#grid(
  columns: 4,
  align: (center, right, center, left),
  column-gutter: 0.3em,
  row-gutter: 0.45em,
  [], $0$, $<$, $abs(x_a)$,
  $+$, $0$, $<$, $abs(x_b)$,
  grid.hline(stroke: 0.5pt),
  [], $0$, $<$, $abs(x_a) + abs(x_b)$,
)
$

==== Case $norm(x)_oo$
Consider $norm(x)_oo != 0$. Thus it follows by subsitution:
$ norm(x)_oo = max{|x_1|,...,|x_n|} = 0 $
$ norm(x)_oo equiv |x_a| : forall x in {|x_1|,...,|x_n|}, x <= |x_a| $

By trichotomy $forall x in {x_1, ..., x_n}$ we can say $x$ must be either positive, negative, or exactly zero. Given $|x_a| = 0$
$
| x_a | = 0 ==> x_a = 0
$

=== Back Proof
WWTS $q ==> p equiv ~q or p equiv (x != 0) ==> (norm(x) == 0)$

