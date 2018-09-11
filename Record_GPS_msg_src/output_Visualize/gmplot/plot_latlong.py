from gmplot import gmplot
import numpy as np

gmap = gmplot.GoogleMapPlotter(42.21783138, -83.73578269, 220.9506073)

data_navsatfix = np.loadtxt("../navsatfix.txt", delimiter=" ")

latitudes = data_navsatfix[:, 0]
longtitudes = data_navsatfix[:, 1]
altitudes = data_navsatfix[:, 2]

gmap.plot(latitudes, longtitudes, 'cornflowerblue', edge_width=1)


gmap.draw("test_at_locker_map.html")
