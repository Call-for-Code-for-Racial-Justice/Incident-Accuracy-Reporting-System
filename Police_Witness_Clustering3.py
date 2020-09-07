#!/usr/bin/env python
# coding: utf-8

# In[1]:


"""Importing dependencies"""
#import pkg_resources
#assert pkg_resources.get_distribution('scikit-learn').version == '0.20'
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
from watson_machine_learning_client import WatsonMachineLearningAPIClient
from sklearn.pipeline import Pipeline
import seaborn as sns
from sklearn.metrics import silhouette_score, adjusted_rand_score
from sklearn.base import BaseEstimator, TransformerMixin


# In[1]:


#!pip install scikit-learn==0.20


# In[2]:


#import sklearn
#sklearn.__version__


# In[3]:


#!pip uninstall scikit-learn==0.22


# In[63]:


"""Fetching the dataset"""
import types
import pandas as pd
from botocore.client import Config
import ibm_boto3

def __iter__(self): return 0

# @hidden_cell
# The following code accesses a file in your IBM Cloud Object Storage. It includes your credentials.
# You might want to remove those credentials before you share the notebook.
client_5788a23eb2574c7cb39229a0bce71857 = ibm_boto3.client(service_name='s3',
    ibm_api_key_id='vtgKu_QT4p7Kp9nwFU8u7YJGG6nSi9Mw4UQ_rDKrvXJl',
    ibm_auth_endpoint="https://iam.cloud.ibm.com/oidc/token",
    config=Config(signature_version='oauth'),
    endpoint_url='https://s3-api.us-geo.objectstorage.service.networklayer.com')

body = client_5788a23eb2574c7cb39229a0bce71857.get_object(Bucket='embrace3-donotdelete-pr-cwama7g5kpc0cb',Key='sample_data.xlsx')['Body']
# add missing __iter__ method, so pandas accepts body as file-like object
if not hasattr(body, "__iter__"): body.__iter__ = types.MethodType( __iter__, body )

df_data_0 = pd.read_excel(body)
df_data_0.head()


# In[64]:


"""Converting DataFrame into a list of reports"""

# doc_file = []
# for i in df_data_0[df_data_0.columns[1]]:
#     doc_file.append(i)
# len(doc_file)

class Converter(BaseEstimator, TransformerMixin):
    #def __init__(self, doc_file):
        #self.doc_file = []
    def fit(self, X, y=None):
        return self
    def transform(self, X):
        return X[X.columns[1]].tolist()


# In[46]:


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


# In[5]:


import nltk
nltk.download('punkt')


# In[81]:


"""Vectorizing the data"""

vectorizer = TfidfVectorizer(max_df=0.8, max_features=200000,min_df=0.2,tokenizer=tokenize_and_stem,input='content',use_idf=True, stop_words='english',ngram_range=(1,3))


# In[48]:


class Dist_Vector(BaseEstimator, TransformerMixin):
    #def __init__(self):
     #   self.text = text
    def fit(self, X, y=None):
        return self
    def transform(self, X):
        return 1 - cosine_similarity(X)


# In[82]:


preprocessor = Pipeline([('converter', Converter()),
                          ('preprocessor', vectorizer),])


# In[83]:


kM = KMeans(n_clusters=2)


# In[84]:


clusterer = Pipeline([ ('clustering_model', kM)])


# In[85]:


mds = MDS(n_components=2, dissimilarity="precomputed", random_state=1)


# In[86]:


postprocessor = Pipeline([('dist_vector', Dist_Vector()),
                           ('mds', mds),])


# In[87]:


model_pipeline = Pipeline([('preprocess', preprocessor),                               
                           ('clustering_model', clusterer),
                           ('postprocess', postprocessor)
                            ])


# In[88]:


model_pipeline.fit(df_data_0)


# In[89]:


X = model_pipeline['preprocess'].fit_transform(df_data_0)


# In[90]:


kMeans_Clusterer = model_pipeline['clustering_model'].fit(X)


# In[91]:


pos = model_pipeline['postprocess'].fit_transform(X)


# In[64]:


#pos


# In[92]:


clusters = kM.labels_.tolist()


# In[93]:


"""labelling each datapoint"""

doc_label = []
#true_label = []
t=0
u=0
for i in pos:
    t=t+1
    if t<=101:
        q='W'+str(t)
        doc_label.append(q)
        #true_label.append(0)
    else:
        #u=u+1
        q='POLICE'
        doc_label.append(q)
        #true_label.append(1)


# In[94]:


docs = { 'label': doc_label, 'documents': df_data_0[df_data_0.columns[1]].tolist(), 'cluster': clusters }
cluster_frame = pd.DataFrame(docs, index = [clusters] , columns = ['label', 'cluster'])
print() 
print(cluster_frame['cluster'].value_counts())
xs, ys = pos[:, 0], pos[:, 1]
cluster_colors = {0: 'r', 1: 'b'}
cluster_names = {0: 'cluster 0', 1: 'cluster 1'}
#create data frame that has the result of the MDS plus the cluster numbers and labels
df = pd.DataFrame(dict(x=xs, y=ys, doc_cluster=clusters, label=doc_label)) 

#group by cluster
groups = df.groupby('doc_cluster')


# In[96]:


""" setting up plot"""

fig, ax = plt.subplots(figsize=(18, 10)) 
ax.margins(0.05)

"""iterate through groups to layer the plotusing cluster_name and cluster_color 
dicts with the 'name' lookup to return the appropriate color/label"""

plt.figure(1)
for name, group in groups:
    ax.plot(group.x, group.y, marker='o', linestyle='', ms=12, 
            label=cluster_names[name], color=cluster_colors[name], 
            mec='none')
    
    ax.set_aspect('auto')
    ax.tick_params(axis= 'x', which='both', bottom='off', top='off', labelbottom='off')
    ax.tick_params(axis= 'y', which='both', left='off', top='off', labelleft='off')
    
ax.legend(numpoints=1)  #show legend with only 1 point

#add label in x,y position with the label as the class folder name
for i in range(len(df)):
    ax.text(df.ix[i]['x'], df.ix[i]['y'], df.ix[i]['label'], size=12)  
# ax.plot(group.x[-1:], group.y[-1:], marker='o', linestyle='', ms=20, 
#             label=cluster_names[name][-1:], color='g', 
#             mec='none')


# In[22]:


# Look up your Watson Machine Learning credentials and then paste them here
wml_credentials = {
  "apikey": "dWzkkvL2bLQmEdtykM-m-UTOj4tMgbGsV9_kH7pR_F4o",
  "iam_apikey_description": "Auto-generated for key 14c68e36-9934-4e3d-9d2c-c507c269763b",
  "iam_apikey_name": "wdp-writer",
  "iam_role_crn": "crn:v1:bluemix:public:iam::::serviceRole:Writer",
  "iam_serviceid_crn": "crn:v1:bluemix:public:iam-identity::a/170e823b3ebd4e5abecce338189a2148::serviceid:ServiceId-8398b54f-cf2f-4e02-be72-2e131c4def79",
  "instance_id": "ee05331f-1bfe-43cf-b066-ec4bf24e84eb",
  "url": "https://us-south.ml.cloud.ibm.com"
}

# Instantiate WatsonMachineLearningAPIClient
from watson_machine_learning_client import WatsonMachineLearningAPIClient
client = WatsonMachineLearningAPIClient( wml_credentials )


# In[24]:


#stored_model_details = client.repository.store_model(model_pipeline, "embrace_kMeans")


# In[71]:


stored_model_details


# In[4]:


#online_deployment = client.deployments.create('a01b2b8b-67a5-4b86-b964-5970377a1a7f', 'Embrace_Clustering', 'Clustering model deployment.')


# In[73]:


import sklearn
sklearn.__version__


# In[ ]:




