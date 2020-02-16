import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

X = np.random.rand(100,2)
print("第一筆[0]資料內容:\n",X[0])
#plt.show(plt.scatter(X[:,0],X[:,1],s=50))# 畫出資料分布圖
# build model
clf = KMeans(n_clusters=3)
clf.fit(X)
print('訓練後資料標籤的結果：\n',clf.labels_)
#plt.show(plt.scatter(X[:,0],X[:,1], c=clf.labels_)
