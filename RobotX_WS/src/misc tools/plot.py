import matplotlib.pyplot as plt

f = open("test.txt")
lines = f.readlines()
ctr = len(lines)
lists = []

for i in range(ctr):
	if i>=15:
		lines[i] = lines[i].strip()
		entries = lines[i].split("\r")
		# print entries
		for i in entries:
			l = list(map(float,i.split(',')))
			lists.append(l)
plt.plot(lists, label='a')
plt.legend()
plt.show()