import numpy as np
from scipy.stats import ttest_ind

campaign_A = np.random.binomial(1,0.12,1000)
campaign_B = np.random.binomial(1,0.15,1000)

stat,pvalue = ttest_ind(campaign_A,campaign_B)

print("p-value:",pvalue)

if pvalue < 0.05:
    print("Campaign B performs significantly better")
else:
    print("No significant difference")