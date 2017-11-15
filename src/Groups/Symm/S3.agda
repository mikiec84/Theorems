module Groups.Symm.S3 where

open import Agda.Builtin.Equality

------------------------------------------------------------------------
-- definitions

bin-op : ∀ {ℓ} (A : Set ℓ) → Set ℓ
bin-op A = A → A → A

------------------------------------------------------------------------
-- internal stuffs

private

  s3-xyx=y : ∀ {ℓ} {S3 : Set ℓ} (x y e : S3) (_×_ : bin-op S3) →
       (∀ a b c → (a × b) × c ≡ a × (b × c)) →
       (∀ a b c → a × (b × c) ≡ (a × b) × c) →
       (∀ x → e × x ≡ x) →
       -- (y × y ≡ e) →
       ((x × x) × x ≡ e) →
       (y × x ≡ (x × x) × y) →
       ((x × y) × x ≡ y)
  s3-xyx=y x y e _×_ assoc assoc-flip id xxx=1 yx=xxy
    rewrite assoc x y x
          | yx=xxy
          | assoc-flip x (x × x) y
          | assoc-flip x x x
          | xxx=1
            = id y

------------------------------------------------------------------------
-- public aliases

s3-property-1 : ∀ {ℓ} {S3 : Set ℓ} (x y e : S3) (_×_ : bin-op S3) →
    (∀ a b c → (a × b) × c ≡ a × (b × c)) →
    (∀ a b c → a × (b × c) ≡ (a × b) × c) →
    (∀ x → e × x ≡ x) → ((x × x) × x ≡ e) → (y × x ≡ (x × x) × y) →
    ((x × y) × x ≡ y)
s3-property-1 = s3-xyx=y