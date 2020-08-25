#!/usr/bin/env python
# coding: utf-8

# In[4]:


"""Importing dependencies"""

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans
import os
from nltk.stem.snowball import SnowballStemmer
from nltk.tokenize import word_tokenize
from nltk.tokenize import sent_tokenize
import re
from sklearn.metrics.pairwise import cosine_similarity
import matplotlib.pyplot as plt
from sklearn.manifold import MDS
import pandas as pd
from sklearn.metrics import accuracy_score
from scipy.cluster.hierarchy import ward, dendrogram


# In[5]:


"""The tokenize_and_stem function below does the following: It removes the
stopwords, tokenizes the messages and also stems the individual words by converting
words of similar meaning to the same stem words"""

def tokenize_and_stem(text):
    stemmer = SnowballStemmer("english")
    # first tokenize by sentence, then by word to ensure that punctuation is caught as it's own token
    tokens = [word for sent in sent_tokenize(text) for word in word_tokenize(sent)]
    filtered_tokens = []
    # filter out any tokens not containing letters (e.g., numeric tokens, raw punctuation)
    for token in tokens:
        if re.search('[a-zA-Z]', token):
            filtered_tokens.append(token)
    stems = [stemmer.stem(t) for t in filtered_tokens]
    return stems


# In[55]:


"""Fetching the dataset"""

# @hidden_cell
# The following code contains the credentials for a file in your IBM Cloud Object Storage.
# You might want to remove those credentials before you share your notebook.
import types
import pandas as pd
from botocore.client import Config
import ibm_boto3

def __iter__(self): return 0

# @hidden_cell
# The following code accesses a file in your IBM Cloud Object Storage. It includes your credentials.
# You might want to remove those credentials before you share the notebook.
client_72c2da47609b4ceea8396c4332b98ef3 = ibm_boto3.client(service_name='s3',
    ibm_api_key_id='EEB_eyafuWQgnI1E7MWq7eu_VU_b_VDY4fbOK5lTGDwg',
    ibm_auth_endpoint="https://iam.cloud.ibm.com/oidc/token",
    config=Config(signature_version='oauth'),
    endpoint_url='https://s3-api.us-geo.objectstorage.service.networklayer.com')

body = client_72c2da47609b4ceea8396c4332b98ef3.get_object(Bucket='embrace2-donotdelete-pr-wpnplsoeambclj',Key='sample_data.xlsx')['Body']
# add missing __iter__ method, so pandas accepts body as file-like object
if not hasattr(body, "__iter__"): body.__iter__ = types.MethodType( __iter__, body )

df_data_0 = pd.read_excel(body)
#df_data_0.tail()


# In[11]:


"""Converting DataFrame into a list of reports"""

doc_file = []
for i in df_data_0[df_data_0.columns[1]]:
    doc_file.append(i)
len(doc_file)


# In[21]:


"""labelling each datapoint"""

doc_label = []
#true_label = []
t=0
u=0
for i in doc_file:
    t=t+1
    if t<=100:
        q='W'+str(t)
        doc_label.append(q)
        #true_label.append(0)
    else:
        #u=u+1
        q='POLICE'
        doc_label.append(q)
        #true_label.append(1)


# In[14]:


# import nltk
# nltk.download('punkt')


# In[15]:


"""Vectorizing the data"""

vectorizer = TfidfVectorizer(max_df=0.8, max_features=200000,min_df=0.2,tokenizer=tokenize_and_stem,input='content',use_idf=True, stop_words='english',ngram_range=(1,3))
X = vectorizer.fit_transform(doc_file)
dist_vector = 1 - cosine_similarity(X)


# In[22]:


"""Running the kMeans Algorithm"""

true_k = 2
clustering_model = KMeans(n_clusters=true_k)
clustering_model.fit(X)
clusters = clustering_model.labels_.tolist()
print
print("Top terms per cluster:")
order_centroids = clustering_model.cluster_centers_.argsort()[:, ::-1]
terms = vectorizer.get_feature_names()
for i in range(true_k):
    print ("Cluster %d:" % i,)
    for t in order_centroids[i, :10]:
        print (' %s' % terms[t],)
    print()


# In[52]:


"""Creating a dataframe for the better presentation of the clusters.
This will also be used in generating some plots for a proper
visualization of the data points after running the algorithm"""

docs = { 'label': doc_label, 'documents': doc_file, 'cluster': clusters }
cluster_frame = pd.DataFrame(docs, index = [clusters] , columns = ['label', 'cluster'])
print() 
print(cluster_frame['cluster'].value_counts())
mds = MDS(n_components=2, dissimilarity="precomputed", random_state=1)

pos = mds.fit_transform(dist_vector)  # shape (n_components, n_samples)

xs, ys = pos[:, 0], pos[:, 1]
cluster_colors = {0: 'r', 1: 'b'}
cluster_names = {0: 'cluster 0', 1: 'cluster 1'}
#create data frame that has the result of the MDS plus the cluster numbers and labels
df = pd.DataFrame(dict(x=xs, y=ys, doc_cluster=clusters, label=doc_label)) 

#group by cluster
groups = df.groupby('doc_cluster')


# In[54]:


# for name, group in groups:
#     print(group)


# In[53]:


""" setting up plot"""

fig, ax = plt.subplots(figsize=(18, 10)) 
ax.margins(0.05)

"""iterate through groups to layer the plotusing cluster_name and cluster_color 
dicts with the 'name' lookup to return the appropriate color/label"""

plt.figure(1)
for name, group in groups:
    ax.plot(group.x[:-1], group.y[:-1], marker='o', linestyle='', ms=12, 
            label=cluster_names[name], color=cluster_colors[name], 
            mec='none')
    
    ax.set_aspect('auto')
    ax.tick_params(axis= 'x', which='both', bottom='off', top='off', labelbottom='off')
    ax.tick_params(axis= 'y', which='both', left='off', top='off', labelleft='off')
    
ax.legend(numpoints=1)  #show legend with only 1 point

#add label in x,y position with the label as the class folder name
for i in range(len(df)):
    ax.text(df.ix[i]['x'], df.ix[i]['y'], df.ix[i]['label'], size=12)  
ax.plot(group.x[-1:], group.y[-1:], marker='o', linestyle='', ms=20, 
            label=cluster_names[name][-1:], color='g', 
            mec='none')


# In[ ]:




