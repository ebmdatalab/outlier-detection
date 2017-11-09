# Detecting changes in Price-Per-Unit using CUSUM

We calculated the price-per-unit (NIC/quantity) and aggregated nationally and at both presentation level and chemical level (in two separate notebooks). From the resulting tables, we ran the CUSUM algorithm, which detected both increases and decreases in PPU over time. We then determined the size of these detected changes, both as an absolute value and as a proportion, as well as the duration over which they occur.

Following this, we ranked and filtered the results with the aim of identifying the most intereting changes. Results are displayed in tables, along with sparklines (from here https://github.com/iiSeymour/sparkline-nb).

We decided to park this as it appeared to show mostly things that meds op people etc. would already be aware of.

## This could be used:
- As part of gouging detection in future
- As a feature on the site, where interesting price fluctuations 

## Further development:
- Do at chemical/dose pair level
- Fix CUSUM missing values
- Make a more robust method of calculating duration
- Determine the best way of filtering/sorting to identify interestingness