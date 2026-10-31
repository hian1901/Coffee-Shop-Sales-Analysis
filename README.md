# ☕ Coffee Shop Sales Analytics & Customer Behavior Dashboard

<img width="1310" height="791" alt="Screenshot 2026-10-31 180253" src="https://github.com/user-attachments/assets/99a0b233-a15d-4505-b7c2-4f54f74f1634" />

---

## 📌 1. Project Overview & Business Problem
This project analyzes the 6-month retail operations of a specialty coffee chain operating across three prime locations in New York City (**Hell's Kitchen**, **Astoria**, and **Lower Manhattan**). 

The primary objective is to transform raw, transactional data into an end-to-end Business Intelligence solution that enables executive leadership to:
* Track financial health and Month-over-Month (MoM) revenue momentum.
* Identify high-converting purchasing patterns across peak operating hours, days of the week, and beverage preferences.
* Formulate data-driven operational and marketing strategies to optimize staffing, manage inventory, and expand Average Order Value (AOV).

---

## 🛠️ 2. Tech Stack & Data Architecture
* **Database & ETL Engine:** `MySQL Server 8.0`
  * Applied robust SQL data hygiene: deduplicated records using CTEs and `ROW_NUMBER()`, converted string date/time formats via `STR_TO_DATE()`, computed itemized revenues, and standardized schema constraints.
* **BI Platform & Semantic Modeling:** `Power BI Desktop`
  * Architected an enterprise-grade **Star Schema** centered around a normalized `Date_table` with unidirectional (`1 ➔ *`) filter propagation.
* **Advanced DAX Formulas:**
  * Implemented defensive time-intelligence measures using `TOTALMTD`, `CALCULATE`, and `DATEADD`.
  * Dynamic visual formatting using `ALLSELECTED` nested inside `AVERAGEX` to render continuous benchmark average lines.
  * Zero-value baseline hacking (`Placeholder = 0`) to achieve dual-aligned labels in horizontal bar visuals while eliminating redundant categorical axis clutter.

---

## 📊 3. Key Metrics & KPIs Tracked
* **CM Sales (Current Month Revenue):** Monitored alongside real-time variance vs. Prior Month (`MoM % | $ Diff vs LM`).
* **CM Orders & CM Quantity Sold:** Evaluates transactional throughput and volume elasticity across billing cycles.
* **Daily Average Benchmark:** Identifies daily performance outliers categorized into `Above Avg` or `Below Avg`.
* **Category Contribution & Day-Type Distribution:** Assesses portfolio reliance and lifestyle-driven purchasing behaviors.

---

## 💡 4. In-Depth Actionable Insights & Strategic Recommendations

### 📈 Insight 1: 6-Month Growth Trajectory & The February "Calendar Effect"
* **Data Observation:** Over the 6-month evaluation period, the business demonstrated sustained positive sales momentum. While February initially appeared as a revenue contraction on the monthly column chart, deep-dive root-cause analysis revealed this was an artifact of the **"Calendar Deficit"** (February having only 28 days—3 fewer days than January).
* **True Underlying Trend:** Normalizing the metric to **Daily Average Sales (`Daily Avg`)** proved that operational performance per active trading day continued to climb steadily without disruption.
* 💡 **Strategic Recommendation:** Executive quarterly reporting must consistently pair aggregate totals with normalized Daily Average Benchmarks to prevent distorted interpretations of business vitality caused by calendar variations.

---

### ⏰ Insight 2: Morning Peak Rush (8:00 – 10:00 AM) & The Breakfast Combo Lever
* **Data Observation:** Throughout all weeks and months, customer foot traffic concentrated aggressively in the morning window between **8:00 AM and 10:00 AM**. Commuters, office workers, and students purchase predominantly **Barista Espresso** drinks on their way to work or school.
* 💡 **Operational & Commercial Recommendations:**
  * **Workforce Reallocation:** Heavily staff baristas and cashier stations during the morning shift (7:30 – 10:30 AM) to minimize queue bottlenecks and eliminate order abandonment; scale down late-afternoon staffing to trim operational overhead.
  * **Supply Chain Security:** Guarantee zero stockout for premium espresso bean inventories at opening hours.
  * **Morning Bundling Strategy:** Current data shows Bakery products generate only ~11.8% of total revenue due to single-beverage grab-and-go behavior. Introduce a high-converting **"Morning Energy Combo: Barista Espresso + Pastry at 15% off"** to stimulate cross-selling and uplift Average Order Value (AOV).

---

### 🏢 Insight 3: Store Footprint Equivalence & Untapped Corporate Potential
* **Data Observation:** Revenue generation is remarkably balanced across all three locations: **Hell's Kitchen (~34%)**, **Astoria (~33%)**, and **Lower Manhattan (~33%)**. This uniformity proves robust brand resilience independent of any single neighborhood.

---

### 🍵 Insight 4: The Rise of Tea & Shifting Consumer Wellness Trends
* **Data Observation:** Monthly growth in the **Tea category (+33.5% MoM)** consistently outpaced Coffee (+31.3% MoM). Consumer purchasing reflects a macro-shift toward refreshing, wellness-oriented, low-caffeine alternatives.
* 💡 **Product Line Extension:**
  * Tighten replenishment cycles for specialty loose-leaf teas to safeguard against stockouts during rapid adoption phases.
  * Capitalize on summer demand by introducing seasonal high-margin items (e.g., Cold Brew Fruit Teas, Herbal Wellness Tonics) to capture market share among health-conscious demographics.

---

## 🎯 5. Executive Action Matrix

| Strategic Pillar | Identified Bottleneck | Proposed Actionable Initiative | Expected Business Impact |
| :--- | :--- | :--- | :--- |
| **Sales (AOV)** | High share of single-item beverage transactions | Launch **Espresso + Bakery Morning Combos** (8–10 AM) | **+15% to +20%** Lift in Basket Size |
| **Menu Innovation** | Tea demand accelerating faster than coffee | Expand artisan iced tea line & tighten tea inventory | **+35%** Year-over-Year Tea Revenue |
| **Store Operations** | Morning bottlenecks vs. afternoon labor idle time | Reallocate baristas to 7:30–10:30 AM morning shift | **-50%** Counter Wait Time |
