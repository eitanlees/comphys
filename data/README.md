# Data

Data files for the exercises and the Python sections. The book copies this
folder into the published site, so readers can download them.

| File | Used in | Notes |
|---|---|---|
| `grains.dat` | Ex 2.8 | **Stand-in.** The original from the 2011 course is lost (see below). |
| `BK-7.dat` | (nothing loads it) | The BK-7 refractive index table that ch 4 prints inline. |
| `boiling.dat` | Ch 4 exercise | |
| `decay.out` | Ch 6 exercise and code cell, Ch 9 exercise | |
| `data91.dat`, `data94.dat`, `data95.dat` | Ch 9 exercises (`data95.dat` also a code cell) | |
| `hist.csv` | Ch 9 code cells | Origin not yet documented. |
| `MC.csv` | Ch 7 code cell | Origin not yet documented. |

## grains.dat

Ex 2.8 reads 50 grain sizes in mm from `grains.dat`, which presumably lived on the course
server and hasn't turned up since. This stand-in keeps to what the lecture
says about it: 50 sizes, all between 1.0 and 2.0 mm, one per line for
`scanf("%f")`. The sizes are log-normal (median 1.4 mm), rounded to 0.01 mm,
so a few fall exactly on a bin boundary. It was generated with:

```python
import numpy as np
rng = np.random.default_rng(2011)
sizes = []
while len(sizes) < 50:
    d = round(float(rng.lognormal(np.log(1.4), 0.15)), 2)
    if 1.0 < d < 2.0:
        sizes.append(d)
np.savetxt("data/grains.dat", sizes, fmt="%.2f")
```

If the original turns up, replace this file and drop the footnote in Ex 2.8.
