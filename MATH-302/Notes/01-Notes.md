---
id: 01-Notes
aliases: []
tags: []
---
## The big idea
---

A norm measures the _size of a single vector_; a metric measures the _distance between two points_. The whole proof is the observation that in a vector space you can convert one into the other: the displacement from $y$ to $x$ is the vector $x-y$, so "how far apart are $x$ and $y$" becomes "how big is $x-y$." Once you set $d(x,y) = \|x-y\|$, each metric axiom falls out of a corresponding norm axiom.

The correspondence is essentially one-to-one:

| Norm axiom                                               | gives | Metric axiom               |
| -------------------------------------------------------- | ----- | -------------------------- |
| $\|v\| \ge 0$                                            | →     | non-negativity             |
| $\|v\| = 0 \iff v = \vec{0}$                             | →     | identity of indiscernibles |
| $\|\lambda v\| = \|\lambda\|\,\|v\|$ (at $\lambda = -1$) | →     | symmetry                   |
| $\|a+b\| \le \|a\| + \|b\|$                              | →     | triangle inequality        |

## Walking through the four steps

**Non-negativity and definiteness** are direct restatements — you substitute $v = x-y$ into the norm axiom and you're done. Nothing happens here beyond bookkeeping.

**Symmetry** is the first place something is actually used. The norm doesn't know about "direction," but $x - y$ and $y - x$ are different vectors, so you do have to argue they have the same size. That's exactly what homogeneity with $\lambda = -1$ gives you: $\|-(y-x)\| = |-1| \cdot \|y - x\| = \|y-x\|$. The reason this works in any normed space is that $-1$ is a scalar in the underlying field ($\mathbb{R}$ or $\mathbb{C}$), so the axiom applies.

**Triangle inequality** is the only step with a genuine idea in it, and it's the "insert and subtract" trick:
$$x - y = (x - z) + (z - y).$$
The $z$ cancels, so this is an identity, not an assumption. But it lets you write the single vector $x-y$ as a _sum_ of two vectors, which is the exact shape the norm's triangle inequality expects. Setting $a = x-z$, $b = z-y$:
$$\|x-y\| = \|a+b\| \le \|a\| + \|b\| = \|x-z\| + \|z-y\|.$$
Geometrically this is the familiar statement that detouring through $z$ never shortens the trip.

## A few things I'd fix in the write-up

**Definition 1.1 isn't a definition.** As stated, it defines a metric space using $\|x-y\|$ — but a metric space is a set with _any_ function $d$ satisfying those four properties, with no norm in sight. Right now the definition and the proof are the same object stated twice, and the definition is circular for the purposes of this problem. It should read:

> [!pf|t]  A set $V$ is a metric space if equipped with $d: V \times V \to \mathbb{R}$ such that for all $x,y,z \in V$: (1) $d(x,y) \ge 0$; (2) $d(x,y) = 0 \iff x = y$; (3) $d(x,y) = d(y,x)$; (4) $d(x,y) \le d(x,z) + d(z,y)$.

Then the proof does the work of checking $d(x,y) = \|x-y\|$ satisfies them. As a bonus, the definition block is currently inconsistent with itself — items 1–3 carry justifications while item 4 is bare.

**The biconditional is only proved one way.** You assume $d(x,y)=0$ and derive $x=y$. The reverse ($x=y \Rightarrow \|x-y\| = \|\vec{0}\| = 0$) is trivial but should be stated, or you should phrase the norm axiom as an $\iff$ and note the chain of equivalences runs both directions.

**Optional remark worth adding.** Non-negativity is actually redundant — it follows from axioms 2–4:
$$0 = d(x,x) \le d(x,y) + d(y,x) = 2d(x,y).$$
Many texts therefore state a metric with only three axioms. Not required here, but it's the kind of observation that shows you understand the axiom system rather than just checking boxes.

## Worth knowing: the converse fails

Every norm induces a metric, but not every metric comes from a norm. The discrete metric on $\mathbb{R}$ ($d(x,y) = 1$ when $x \neq y$) is a perfectly good metric, but if it came from a norm you'd need $\|2x\| = 2\|x\|$, which fails since both sides are $1$. A metric on a vector space arises from a norm precisely when it's translation-invariant ($d(x+v, y+v) = d(x,y)$) and absolutely homogeneous ($d(\lambda x, \lambda y) = |\lambda| d(x,y)$) — in which case you recover the norm as $\|x\| = d(x, \vec{0})$.

So "normed space $\Rightarrow$ metric space" is a strictly one-way street, which is why the word "automatically" in the problem statement is doing real work.
