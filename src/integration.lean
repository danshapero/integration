import analysis.calculus.deriv
import analysis.calculus.mean_value

noncomputable theory

variables {a : ℝ} {b : ℝ}

structure partition (a : ℝ) (b : ℝ) :=
(n : ℕ)
(x : fin (n + 1) → ℝ)
(inside : ∀ i : fin (n + 1), x i ∈ [a, b])
(monotone : ∀ i j : fin (n + 1), i ≤ j → x i ≤ x j)

def is_refinement (p1 : partition a b) (p2 : partition a b) :=
∀ i : fin (p1.n + 1), ∃ j : fin (p2.n + 1), p2.x j = p1.x i