# Mortality Study  
## Data Available in the EGB (October 2019) and Data Used

## Description of Files

Two files are available: one for **men** and one for **women**.

| Variable         | Description                                               |
|------------------|-----------------------------------------------------------|
| **Age**          | Age in years                                              |
| **CCI0**         | Mortality rate in the absence of comorbidity              |
| **SxFict_FCCI0** | Survival order in the absence of comorbidity              |
| **EV_CCI0**      | Life expectancy in the absence of comorbidity             |
| **CCI1**         | Mortality rate with a low level of comorbidity            |
| **SxFict_FCCI1** | Survival order with a low level of comorbidity            |
| **EV_CCI1**      | Life expectancy with a low level of comorbidity           |
| **CCI2**         | Mortality rate with an intermediate level of comorbidity  |
| **SxFict_FCCI2** | Survival order with an intermediate level of comorbidity  |
| **EV_CCI2**      | Life expectancy with an intermediate level of comorbidity |
| **CCI3**         | Mortality rate with a high level of comorbidity           |
| **SxFict_FCCI3** | Survival order with a high level of comorbidity           |
| **EV_CCI3**      | Life expectancy with a high level of comorbidity          |

---

## Data Used

- **Population**: Simplified General Sample of Beneficiaries (**EGBs**) - **SNDS**
- **Criteria**:
  - Individuals aged **18 years or older**
  - Residing in **mainland France** (excluding Corsica and overseas territories)
- **Study Period**: **2011–2018** (maximum available period)

---

## Definition and Identification of Comorbidities

### Measuring Comorbidities

- **Charlson Comorbidity Index** (*Charlson, Pompei et al. 1987*)
- **CCI score** categorized as:
  - **CCI = 0** → *No comorbidity*
  - **0 < CCI < 3** → *Low level*
  - **3 ≤ CCI < 5** → *Intermediate level*
  - **CCI ≥ 5** → *High level*

### Identification in the EGBs

- Hospital diagnoses and **ALD** (coded in **ICD-10**)
- Specific medication consumption
- Discriminant medical procedures
- Published algorithm (*Quan, Li et al. 2011; Bannay, Chaignot et al. 2016*)

For each year of the period, comorbidities were identified over a **12-month rolling window** before:
- The **date of death** for deceased individuals
- A **random date in 2018** for individuals alive and excluded in 2018

---

🎯 **Objective**: Provide robust estimates of mortality based on levels of comorbidity.

## 🔎 Analysis and Visual Insights

### 1️⃣ Life Expectancy Falls Sharply with Comorbidity Severity – Gender Matters Too

![Life Expectancy by Age and Comorbidity Level](data/images/life_expectancy_by_age_and_comorbidity_level.png)

This chart illustrates how life expectancy changes with age across four Charlson Comorbidity Index (CCI) categories (CCI 0 to CCI 3), separately for men (solid lines) and women (dashed lines). Several patterns emerge:

- **Effect of Comorbidity Burden**  
   Individuals at CCI 0 have substantially higher life expectancy compared to those at CCI 3. For instance, at age 20, those with CCI 0 can expect to live well into their 80s or beyond, while those at CCI 3 typically have fewer than 10 additional years. This large gap underscores the impact of chronic disease burden on survival.

- **Age Gradient**  
   The slope of each curve becomes steeper with advancing age, indicating an accelerating decline in remaining life years. This acceleration is more pronounced in higher CCI levels, where the curve drops sharply as age increases.

- **Gender Differences**  
   Across most CCI levels, women maintain a slight survival advantage over men. However, at higher comorbidity levels (CCI 2 and CCI 3), this gap narrows, suggesting that severe comorbidity diminishes or offsets gender-based survival benefits.

- **Comparison at Midlife**  
   Around age 40, individuals at CCI 0 can still expect multiple decades of life (often 50+ years), whereas those at CCI 3 typically have fewer than 10 remaining years. This stark contrast points to the potential benefits of early prevention and effective management of chronic conditions in midlife.

- **Convergence at Older Ages**  
   After approximately age 90, all curves converge at low remaining life expectancy. By this point, even those with minimal comorbidity approach a similar limit to those with higher burdens, reflecting the overall biological constraints at very advanced ages.

In summary, the data suggest that preventing or reducing comorbidity can substantially extend life expectancy, especially among adults under 70. The persistent though variable gender gap invites further investigation into possible factors, including differences in healthcare utilization, disease profiles, and lifestyle behaviors.

---

## 2️⃣ Simulated Life Expectancy Gains from Reducing Comorbidities

![Life Expectancy Gain by Reducing Comorbidity Level](data/images/life_expectancy_gain.png)

This updated chart shows the estimated **life expectancy gains** when individuals reduce their comorbidity levels—from higher Charlson Comorbidity Index (CCI) categories to lower ones (e.g., **CCI 3 → CCI 0**, **CCI 3 → CCI 2**, **CCI 2 → CCI 1**, **CCI 1 → CCI 0**). Solid lines represent **men**, while dashed lines represent **women**. Several patterns emerge:

- **Largest Gains from Severe to Minimal Comorbidity**  
  Moving from **CCI 3** (high level) to **CCI 0** (no comorbidity) yields the most dramatic increase in remaining years, especially for younger adults. For instance, a 20-year-old man could gain up to **36 additional years**, while a woman of the same age might gain around **34 years**.

- **Midlife Advantage**  
  Although the largest absolute gains occur at younger ages, adults in their **40s and 50s** still stand to benefit substantially. Even reducing comorbidity by just one level (e.g., **CCI 2 → CCI 1**) can add **10+ years** of life at age 40.

- **Elderly Benefits**  
  At older ages (e.g., 80+), the curves taper, but gains remain meaningful. A shift from **CCI 3** to **CCI 0** can still yield an extra **2–3 years** at age 90, underscoring the potential value of late-life interventions.

- **Gender Differences**  
  Men generally show **slightly larger gains** at younger ages—possibly reflecting higher baseline mortality risk—while women’s gains are marginally lower but remain consistent across the lifespan. The gender gap narrows with advancing age, as both groups approach similar upper limits in life expectancy.

- **Non-linear Effects**  
  Reductions from **severe** to **moderate** comorbidity (e.g., **CCI 3 → CCI 2**) produce **bigger jumps** than from **mild** to **no** comorbidity (e.g., **CCI 1 → CCI 0**). This suggests that **earlier and more aggressive** management of chronic conditions can yield proportionally larger dividends in longevity.

In short, **even modest reductions in comorbidity can yield considerable life expectancy benefits**, with **younger and middle-aged adults** reaping the largest absolute gains. These findings reinforce the importance of **preventive care, early detection, and effective treatment** strategies to slow or reverse the progression of chronic diseases.

---

### 3️⃣ Mortality Rate Comparison by Gender at Equal Age and CCI

Even with **identical age and comorbidity levels**, **men exhibit higher mortality rates** than women.

#### Age-Specific Comparisons:

  ![Age 20](data/images/mortality_rate_comparison_at_age_20.png)

  ![Age 40](data/images/mortality_rate_comparison_at_age_40.png)

  ![Age 60](data/images/mortality_rate_comparison_at_age_60.png)

  ![Age 80](data/images/mortality_rate_comparison_at_age_80.png)~~

- **Key Insight**:
  - **Relative mortality risk** for men is **20–30% higher** than for women, across all ages.
  - The **gap is widest** in **younger adults** and **narrows with age**, possibly due to **selective survival**.

**Possible Explanations**:
- **Biological**: Hormonal differences (e.g., estrogen’s protective effects).
- **Behavioral**: Higher risk-taking and lower healthcare engagement among men.
- **Social**: Differential access to care or adherence.

---

### 4️⃣ Survival Profiles Over Time: Impact of Age, Gender, and CCI

  ![Age 20 Female](data/images/survival_probability_for_age_20.png)

  ![Age 40 Female](data/images/survival_probability_for_age_40.png)

  ![Age 60 Female](data/images/survival_probability_for_age_60.png)

  ![Age 80 Female](data/images/survival_probability_for_age_80.png)

### 🔹 Survival Probability Declines Sharply with Higher CCI  

- Across all age groups, **higher comorbidity levels (CCI 3)** lead to a **dramatic decline in survival probability** over time.  
- At age **20**, the difference between CCI 0 and CCI 3 is already visible, but at age **40+**, CCI 3 individuals face **severe survival disadvantages**, often seeing survival probabilities fall below 30% within just a few decades.  

### 🔹 The "Aging Effect" of Comorbidities  

- The survival probability of **a 40-year-old with CCI 3** is comparable to that of an **80-year-old with CCI 0**.  
- This suggests that **severe comorbidity burden accelerates aging effects**, effectively reducing an individual's survival chances to that of someone decades older with no chronic conditions.  

### 🔹 Gender-Based Differences in Survival Profiles  

- **Men’s survival probability declines more rapidly than women’s** at every comorbidity level.  
- Even at **CCI 0**, men see a **steeper drop in survival probability** than women, reinforcing the idea that gender-based biological and behavioral factors play a critical role.  
- At **CCI 3**, however, the survival disadvantage for men becomes less pronounced over time, suggesting that in extreme cases of comorbidity, survival is more dictated by disease burden than gender.  

### 🔹 Implications for Public Health  

- **Preventing the progression to high comorbidity states (CCI 3) is key**—even moderate reductions in disease burden significantly improve long-term survival prospects.  
- **Targeted interventions in midlife (40–60 years)** could offer the most significant gains in survival.  
- **Gender-sensitive health policies** should be considered, with a focus on early detection and lifestyle interventions, particularly for men, to mitigate their higher mortality risk.  

---

## 🧩 Conclusion

This analysis illustrates that **comorbidities exert a profound influence on mortality and life expectancy**, shaping outcomes far more than age alone. The **Charlson Comorbidity Index (CCI)** emerges as a critical determinant, with **each additional burden translating into years of life lost**. 

Importantly, **men face a consistent mortality disadvantage**, suggesting an urgent need for **targeted health policies** addressing **gender disparities**. 

Our simulations highlight that **reducing comorbidities—even modestly—can yield substantial longevity benefits**, particularly when action is taken in **middle adulthood**. This underscores the strategic importance of **early chronic disease prevention, improved access to care, and patient engagement**.

In a rapidly aging society, **preventing and mitigating comorbidity** is not only a **clinical priority** but also a **public health imperative**. Effective management has the potential to **enhance individual life quality**, **extend survival**, and **alleviate systemic healthcare burdens**—a win-win outcome for all stakeholders.