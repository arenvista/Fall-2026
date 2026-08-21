#import "template.typ": *
#import "@preview/tablem:0.3.0": tablem, three-line-table

#show: notes.with(
  title: "MATH 302: Homework 1",
	course: "MATH 302",
	author: "Aren Vista",
	date: "September 8, 2025",
)

// Homework-style: no automatic equation numbers. Delete to restore template default.
#set math.equation(numbering: none)
#set enum(spacing: 1.4em)

#show math.equation: it => {
	show sym.exists: e => e + h(0.17em)
	show sym.forall: f => f + h(0.17em)
	it
}

// Inner product shorthand
#let ip(a, b) = $lr(⟨ #a, #b ⟩)$

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
Therefore if $x < y$ or $y < x$ then $0 < norm(x-y)$. By trichotomy, we have that $x=y$ if and only if $norm(x-y) = 0$. Thus, the "Identity of Indiscernibles" property holds. $qed$

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


