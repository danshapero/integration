import analysis.calculus.deriv
import analysis.calculus.mean_value

open vector

noncomputable theory

variables {a : ℝ} {b : ℝ}

structure partition (a : ℝ) (b : ℝ) :=
(n : ℕ)
(x : vector ℝ (n + 2))
(inside : ∀ i : fin (n + 2), nth x i ∈ [a, b])
(sorted : list.sorted (λ x y : ℝ, x ≤ y) x.val)

def is_refinement (p1 : partition a b) (p2 : partition a b) :=
∀ i : fin (p1.n + 2), ∃ j : fin (p2.n + 2), nth p2.x j = nth p1.x i

local infix `≤`:50 := λ p1 p2 : partition a b, is_refinement p1 p2
